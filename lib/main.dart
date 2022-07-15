import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Screen/Splash_onboarding/splash_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color kPrimaryColor = Color(0xffFF7D33);
    Color kSecondaryColor = Color(0xffCACACA);
    Color kScaffoldBackground = Color(0xffFFF3E9);
    Color p1Color =  Color(0xff6E798C);
    Color white = Color(0xffFFFFFF);
    Color h1Color =Color(0xff343D48);
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
       primaryColor:  kPrimaryColor,
           appBarTheme: AppBarTheme(
          color: kPrimaryColor
      )

      ),
      home: SplashScreen() ,
    );
  }

}

