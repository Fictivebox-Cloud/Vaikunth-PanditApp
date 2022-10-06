import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panditapp/View/login_flow/Name_Screen.dart';
import 'package:panditapp/route_app/page_navigeter_name_route.dart';

import '../View/Earning/components/Life_Time_Puja.dart';
import '../View/Home/Home_Screen.dart';
import '../View/Home/Pages/Notifications_screen.dart';
import '../View/Profile/Profile.dart';
import '../View/Profile/components/Bank/Add_Bank_Account.dart';
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
        return MaterialPageRoute(builder: (BuildContext context)=>const OnboardingScreen() );
      case RouteName.Home_Screen:
        return MaterialPageRoute(builder: (BuildContext context)=>const HomeScreen() );
      case RouteName.PhoneNumber_Screen:
        return MaterialPageRoute(builder: (BuildContext context)=>const PhoneNumberScreen() );

      case RouteName.OTP_verify:
        return MaterialPageRoute(builder: (BuildContext context)=>OTPVerify() );

      case RouteName.Name_screen:
        return MaterialPageRoute(builder: (BuildContext context)=>NameScreen() );

      case RouteName.Profile_Screen:
        return MaterialPageRoute(builder: (BuildContext context)=>const ProfileScreen() );
      case RouteName.Notifications_screen:
        return MaterialPageRoute(builder: (BuildContext context)=>const NotificationsScreen() );
      case RouteName.Life_time_puja:
        return MaterialPageRoute(builder: (BuildContext context)=>const LifeTimePuja() );
      case RouteName.Add_Bank_Account:
        return MaterialPageRoute(builder: (BuildContext context)=> AddBankAccount() );


        default:
          return MaterialPageRoute(builder: (_){
          return const Scaffold(
          body: Center(
            child: Text("No route defined "),
          ),
          );
        });

    }
  }

}