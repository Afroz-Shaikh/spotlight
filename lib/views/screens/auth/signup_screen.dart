import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlight/constants.dart';
import 'package:spotlight/controllers/auth_controller.dart';

import 'package:spotlight/views/widgets/text_inputfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController username = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet<dynamic>(
                    isDismissible: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (builder) {
                      return Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 15),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Signup Error ?',
                                  style: h3.copyWith(color: Colors.red),
                                ),
                                SvgPicture.asset(
                                  'assets/error.svg',
                                  height: 150,
                                ),
                                Text(
                                    'Try Selecting A photo from gallery before filling the text fields',
                                    style: h3.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal))
                              ],
                            ),
                          ),
                          height: 300,
                          width: MediaQuery.of(context).size.width);
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
              ),
            )
          ],
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          primary: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 95.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: h1,
                ),
                Text(
                  'SignUp with email to continue',
                  style: s2,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(),
                Center(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () => authController.pickImage(),
                        child: const CircleAvatar(
                          radius: 64,
                          // backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTP_JmadbknrIqZklsi-tk9cdIcWSn10Ri_Tg&usqp=CAU'),
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 45.h,
                  child: TextInputField(
                      controller: username,
                      isPassword: false,
                      icon: Icons.email,
                      label: 'Username'),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 45.h,
                  child: TextInputField(
                      controller: email,
                      isPassword: false,
                      icon: Icons.lock,
                      label: 'Email'),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 45.h,
                  child: TextInputField(
                      controller: password,
                      isPassword: true,
                      icon: Icons.lock,
                      label: 'Password'),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    authController.registerUser(username.text, email.text,
                        password.text, authController.profilePhoto);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        'SignUp ',
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
                    Navigator.of(context).pop();
                    // SliderTransition(SignUpScreen());
                    // SlidePageRoute(
                    //     direction: AxisDirection.up, child: SignUpScreen());
                  },
                  child: SizedBox(
                    child: Row(
                      children: [
                        Text(
                          'Already have an account ? ',
                          style: s2,
                        ),
                        Text(
                          'Login',
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
        ),
      ),
    );
  }
}
