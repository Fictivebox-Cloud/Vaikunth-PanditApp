import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panditapp/View/login_flow/Name_Screen.dart';
import 'package:panditapp/route_app/page_navigeter_name_route.dart';

import '../View/Earning/components/Life_Time_Puja’s.dart';
import '../View/Home/Home_Screen.dart';
import '../View/Home/Pages/Notifications_screen.dart';
import '../View/Profile/Profile.dart';
import '../View/Splash_onboarding/Onboarding.dart';
import '../View/Splash_onboarding/splash_screen.dart';
import '../View/login_flow/OTP_Verify.dart';
import '../View/login_flow/Phone_Number.dart';

class Routes{

  static Route<dynamic>  generateRoutes(RouteSettings settings){
    final argume = settings.arguments;
    switch(settings.name){
      case RouteName.SplashScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>const SplashScreen() );
      case RouteName.Onboarding_Screen:
        return MaterialPageRoute(builder: (BuildContext context)=>const Onboarding_Screen() );
      case RouteName.Home_Screen:
        return MaterialPageRoute(builder: (BuildContext context)=>const Home_Screen() );
      case RouteName.PhoneNumber_Screen:
        return MaterialPageRoute(builder: (BuildContext context)=>const PhoneNumber_Screen() );

      case RouteName.OTP_verify:
        return MaterialPageRoute(builder: (BuildContext context)=>OTP_verify() );

      case RouteName.Name_screen:
        return MaterialPageRoute(builder: (BuildContext context)=>Name_Screen() );

      case RouteName.Profile_Screen:
        return MaterialPageRoute(builder: (BuildContext context)=>Profile_Screen() );
      case RouteName.Notifications_screen:
        return MaterialPageRoute(builder: (BuildContext context)=>const Notifications_screen() );
      case RouteName.Life_Time_Puja:
        return MaterialPageRoute(builder: (BuildContext context)=>const Life_Time_Puja() );


        default:
          return MaterialPageRoute(builder: (_){
          return Scaffold(
          body: Center(
            child: Text("No route defined "),
          ),
          );
        });

    }
  }

}