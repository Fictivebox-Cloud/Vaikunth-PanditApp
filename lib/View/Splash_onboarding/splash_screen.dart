import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Consts/image_const.dart';
import '../../Util/login_in_User.dart';
import '../../consts/text_const.dart';
import '../../consts/themescolor.dart';
import '../../route_app/page_navigeter_name_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  _timer() async {
   String userId = await LoggedInUserBloc.instance().getUserId();

    Timer(
        const Duration(seconds: 3),
        () => userId == null || userId == "" || userId == "0"?
        Navigator.pushReplacementNamed(context, RouteName.Onboarding_Screen):
        Navigator.pushReplacementNamed(context, RouteName.Home_Screen)
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
          alignment: Alignment.center,
          child: SvgPicture.asset(
            ImageConst().SPLASH_LOGO,
          )),
    );
  }
}
