import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:spotlight/constants.dart';
import 'package:spotlight/controllers/auth_controller.dart';
import 'package:spotlight/views/screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(((value) {
    Get.put(AuthController());
  }));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: ((context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'SPOTLIGHT',
              theme: ThemeData.light().copyWith(
                primaryColor: const Color(0xffFF0709),
                scaffoldBackgroundColor: backgroundColor,
              ),
              home: const LoginScreen());
        }));
  }
}
