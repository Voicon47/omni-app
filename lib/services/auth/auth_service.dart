import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      print("1 - Starting Google Sign-In");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        print("2 - User cancelled sign-in");
        return null; // User cancelled the login
      }
      print("2 - User selected: ${googleUser.email}");
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      print("3 - Auth tokens received");

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print(
        "4 - Signing in with Firebase $googleUser ,Credential: $credential",
      );
      return await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print("❌ Error during Google sign-in: $e");
      return null;
    }
  }
}
