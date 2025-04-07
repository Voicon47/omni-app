import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/src/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: const BoxDecoration(color: Color(0xFF464646)),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // 👈 Positions top & bottom
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Material(
                color: Colors.transparent,
                child: Image.asset('assets/images/splash_img.png'),
              ),
              SizedBox(height: 70.h),
              Text(
                'Smart Home',
                style: Theme.of(
                  context,
                ).textTheme.displayLarge!.copyWith(color: Colors.white),
              ),
              SizedBox(height: 10.h),
              Text(
                'Smart Home can change\nway you live in the future',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: const Color(0xFFBDBDBD),
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(LoginScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      // horizontal: 20.w,
                      vertical: 15.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
