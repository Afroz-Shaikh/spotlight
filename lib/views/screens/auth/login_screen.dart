import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlight/views/screens/auth/signup_screen.dart';
import 'package:spotlight/views/widgets/navigation.dart';
import 'package:spotlight/views/widgets/text_inputfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController pass = TextEditingController();
    return Scaffold(
        body: Container(
      height: 812.h,
      width: 375.w,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SvgPicture.asset('assets/spotlight.svg'),
            ),
            Text(
              'SPOTLIGHT',
              style: h1,
            ),
            Spacer(
              flex: 3,
            ),
            Text(
              'Welcome to Spotlight!',
              style: h3,
            ),
            Text(
              'Login to your account to continue',
              style: s2,
            ),
            Spacer(
              flex: 1,
            ),
            SizedBox(
              height: 45.h,
              child: TextInputField(
                  controller: email,
                  isPassword: false,
                  icon: Icons.email,
                  label: 'Email'),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 45.h,
              child: TextInputField(
                  controller: pass,
                  isPassword: true,
                  icon: Icons.lock,
                  label: 'Password'),
            ),
            const Spacer(),
            InkWell(
              onTap: () => authController.loginUser(email.text, pass.text),
              child: Container(
                child: Center(
                  child: Text(
                    'Login -->',
                    style: h3.copyWith(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                height: 35.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: appRed),
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    SlidePageRoute(
                        direction: AxisDirection.up, child: SignUpScreen()));
                // SliderTransition(SignUpScreen());
                // SlidePageRoute(
                //     direction: AxisDirection.up, child: SignUpScreen());
              },
              child: SizedBox(
                child: Row(
                  children: [
                    Text(
                      'Don\'t have an account ? ',
                      style: s2,
                    ),
                    Text(
                      'SignUp',
                      style: s2.copyWith(
                          color: appRed, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                height: 35.h,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
