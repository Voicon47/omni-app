import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/services/auth/auth_service.dart';
import 'package:smart_home/src/screens/login_screen/components/icon_wrap.dart';

class Login extends StatelessWidget {
  Login({super.key, required this.setLoading});

  final Function setLoading;
  final auth = AuthService();

  void handleOnClick(BuildContext context) async {
    setLoading(true);

    final userCredential = await auth.signInWithGoogle();

    // print("Begin return $userCredential");
    if (!context.mounted) return;
    // final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
    // print("\nidToken: $idToken");

    if (userCredential) {
      // Login successful → Navigate to Home screen
      print("navigate to home screen");
      // await Future.delayed(const Duration(milliseconds: 100)); // smooth delay
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed('/home-screen');
    } else {
      // Optional: Show error or toast
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed or canceled')));
    }
    setLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 12,
        children: [
          Text(
            "Hi my friend",
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "Chose the account you want to login with.",
            style: TextStyle(fontSize: 13.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40.h,
            width: 0.9.sw,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.apple,
                      color: Colors.black,
                      size: 30, // Increased size
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Continue with Apple",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
            width: 0.9.sw,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconWrap(
                      path: 'assets/icons/login_icons/facebook.png',
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Continue with Facebook",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
            width: 0.9.sw,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 233, 30, 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () => {handleOnClick(context)},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconWrap(
                      path: 'assets/icons/login_icons/google.png',
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Continue with Google",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
