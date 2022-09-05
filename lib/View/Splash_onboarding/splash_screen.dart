import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/View/Splash_onboarding/Onboarding.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

Color kPrimaryColor = Color(0xffFF7D33);
Color kSecondaryColor = Color(0xffCACACA);
Color kScaffoldBackground = Color(0xffFFF3E9);



class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Onboarding_Screen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: kPrimaryColor,
          child: Center(child: Text("Baikhunt",
             style: GoogleFonts.lato(
                 fontWeight: FontWeight.w800,
                 color: Colors.white,
                 fontSize: 32,

                 ),

          ),
          )),

    );
  }
}

