import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/config/size_config.dart';
// import 'package:smart_home/src/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/src/screens/login_screen/components/login_oauth.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/login.png',
              height: getProportionateScreenHeight(300),
              width: double.infinity,
              fit: BoxFit.fill,
            ),

            Positioned(
              top: 30.h,
              left: 10.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'SMART',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 33,
                    ),
                  ),
                  Text(
                    'HOME',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 64,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Sign in', style: TextStyle(fontSize: 18)),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(70.0),
              ),
              hintText: 'Email',
              suffixIcon: const Icon(Icons.email, color: Colors.black),
            ),
          ),
        ),

        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(70.0),
              ),
              hintText: 'Password',
              suffixIcon: const Icon(Icons.lock, color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF464646),
                    borderRadius: BorderRadius.circular(70.0),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              // SizedBox(
              //   height: 50.h,
              //   // width: 200.w,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       // backgroundColor: Colors.amberAccent,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //     ),
              //     onPressed: () => {},
              //     child: Row(
              //       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text(
              //           "Another method login",
              //           style: TextStyle(
              //             fontSize: 16,
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         const Icon(Icons.arrow_right, color: Colors.black),
              //       ],
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap:
                    () => {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(height: 0.4.sh, child: Login());
                        },
                      ),
                    },
                child: Text(
                  "Or connect with",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: getProportionateScreenHeight(10)),

        // const Center(child: Text('Don\'t have an account yet?')),
      ],
    );
  }
}
