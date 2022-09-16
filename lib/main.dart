
import 'package:flutter/material.dart';
import 'package:panditapp/View/Home/Home_Screen.dart';
import 'package:panditapp/view_model/ApiCallLogin.dart';
import 'package:panditapp/view_model/BookingViewDetails/Check_Booking_Confirm_OTP.dart';
import 'package:panditapp/view_model/BookingViewDetails/getBookingOTP.dart';
import 'package:panditapp/view_model/CityListApi.dart';
import 'package:panditapp/view_model/Complete_Bookings.dart';
import 'package:panditapp/view_model/Notification_VM.dart';
import 'package:panditapp/view_model/Profile/id_card_view_model.dart';
import 'package:panditapp/view_model/ViewDetails_VM.dart';

import 'package:panditapp/view_model/home_tab/Accept_Booking_Api.dart';
import 'package:panditapp/view_model/home_tab/Online_Ofline_view_model.dart';
import 'package:panditapp/view_model/home_tab/booking_request_view_model.dart';
import 'package:panditapp/view_model/verification_number_api.dart';
import 'package:provider/provider.dart';
import 'View/Splash_onboarding/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';


Future<void>  main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [

       ChangeNotifierProvider(create: (_)=>ApiCallLogin()),
       ChangeNotifierProvider(create: (_)=>Booking_Request_View_Model()),
       ChangeNotifierProvider(create: (_)=>CompleteBookingViewModel()),
       ChangeNotifierProvider(create: (_)=>Accept_Booking_Api()),
       ChangeNotifierProvider(create: (_)=>City_List_Api()),
       ChangeNotifierProvider(create: (_)=>NumberVerifyViewModel()),
       ChangeNotifierProvider(create: (_)=>ViewDetailVM()),
       ChangeNotifierProvider(create: (_)=>NotificationVM()),
       ChangeNotifierProvider(create: (_)=>Online_Ofline_View_Model()),
       ChangeNotifierProvider(create: (_)=>Puja_Confirm_OTP()),
       ChangeNotifierProvider(create: (_)=>Check_Booking_Confirm_OTP_View_Model()),
       ChangeNotifierProvider(create: (_)=>Id_card_view_model_View())


      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Color kPrimaryColor = Color(0xffFF7D33);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor:  kPrimaryColor,
            appBarTheme: AppBarTheme(
                color: kPrimaryColor
            )

        ),
         // home: Home_Screen(),
        home: SplashScreen(),
      );
  }

}

