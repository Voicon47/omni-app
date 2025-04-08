import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/src/screens/home_screen/home_screen.dart';
// import 'package:smart_home/src/screens/login_screen/login_screen.dart';
import 'package:smart_home/src/screens/splash_screen/splash_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return const HomeScreen(); // User is logged in
        } else {
          return const SplashScreen(); // Not logged in
        }
      },
    );
  }
}
