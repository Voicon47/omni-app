import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final Dio dio = Dio();

  Future<bool> signInWithGoogle() async {
    try {
      // 1. Sign in with Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print("User cancelled sign-in");
        return false;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );
      final idToken = await userCredential.user?.getIdToken();
      if (idToken == null) {
        debugPrint("❌ Failed to get Firebase ID token");
        return false;
      }
      // 2. Send Firebase ID token to your Node.js backend
      final response = await dio.post(
        'http://localhost:8017/v1/user/login-google', // 🔁 Replace with your real URL
        data: {"idToken": idToken},
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      print('\nStatus Code: ${response.statusCode}');

      if (response.statusCode != 200) {
        print(response.statusMessage);
        return false;
      }
      // 3. Store tokens from your backend if needed
      final body = response.data;

      final accessToken = body["meta"]["accessToken"];
      final refreshToken = body["meta"]["refreshToken"];
      final userData = body["data"];

      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("user", userData["fullName"]);
      await prefs.setString("accessToken", accessToken);
      await prefs.setString("refreshToken", refreshToken);
      return true;
    } catch (e) {
      print("❌ Error: $e");
      return false;
    }
  }
}
