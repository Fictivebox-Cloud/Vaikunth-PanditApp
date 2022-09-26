import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/View/Home/Home_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Util/login_in_User.dart';
import '../../consts/text_const.dart';
import '../../consts/themescolor.dart';
import '../../route_app/page_navigeter_name_route.dart';
import '../login_flow/Name_Screen.dart';
import 'Onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _timer() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? name = prefs.getString("name");
   String userId = await LoggedInUserBloc.instance().getUserId();

    Timer(
        Duration(seconds: 2),
        () => userId == null || userId == "" || userId == "0"?
            // ? Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => const Onboarding_Screen()))
        Navigator.pushNamed(context, RouteName.Onboarding_Screen):
            // : Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => const Home_Screen()))
        Navigator.pushNamed(context, RouteName.Home_Screen)
    );
  }

  @override
  void initState() {
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: kPrimaryColor,
          child: Center(
            child: Text(
              APPNAME,
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
