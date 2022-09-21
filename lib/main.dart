import 'package:flutter/material.dart';
import 'package:panditapp/View/Home/Home_Screen.dart';
import 'package:panditapp/View/login_flow/Name_Screen.dart';
import 'package:panditapp/view_model/Login/ApiCallLogin.dart';
import 'package:panditapp/view_model/BookingViewDetails/Check_Booking_Confirm_OTP.dart';
import 'package:panditapp/view_model/BookingViewDetails/getBookingOTP.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Bank_List_VM.dart';
import 'package:panditapp/view_model/Login/CityListApi.dart';
import 'package:panditapp/view_model/BookingViewDetails/Complete_Bookings.dart';
import 'package:panditapp/view_model/Earnings_View_Model/Earnings_Home_VM.dart';
import 'package:panditapp/view_model/Profile/Help_Support_Details_VM.dart';
import 'package:panditapp/view_model/Notification_VM.dart';
import 'package:panditapp/view_model/Profile/Personal_Detail_View_Model.dart';
import 'package:panditapp/view_model/Profile/edit_profile_view_model.dart';
import 'package:panditapp/view_model/Profile/id_card_view_model.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Pandit_Bank_List_VM.dart';
import 'package:panditapp/view_model/Login/Service_VM.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Store_bank_VM.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Update_Bank_VM.dart';
import 'package:panditapp/view_model/BookingViewDetails/ViewDetails_VM.dart';
import 'package:panditapp/view_model/home_tab/Accept_Booking_Api.dart';
import 'package:panditapp/view_model/home_tab/Online_Ofline_view_model.dart';
import 'package:panditapp/view_model/home_tab/booking_request_view_model.dart';
import 'package:panditapp/view_model/Login/verification_number_api.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'View/Splash_onboarding/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiCallLogin()),
        ChangeNotifierProvider(create: (_) => Booking_Request_View_Model()),
        ChangeNotifierProvider(create: (_) => CompleteBookingViewModel()),
        ChangeNotifierProvider(create: (_) => Accept_Booking_Api()),
        ChangeNotifierProvider(create: (_) => City_List_Api()),
        ChangeNotifierProvider(create: (_) => NumberVerifyViewModel()),
        ChangeNotifierProvider(create: (_) => ViewDetailVM()),
        ChangeNotifierProvider(create: (_) => NotificationVM()),
        ChangeNotifierProvider(create: (_) => ServiceVM()),
        ChangeNotifierProvider(create: (_) => BankList_VM()),
        ChangeNotifierProvider(create: (_) => Pandit_Bank_List_VM()),
        ChangeNotifierProvider(create: (_) => HelpSupportDetails_VM()),
        ChangeNotifierProvider(create: (_) => NotificationVM()),
        ChangeNotifierProvider(create: (_) => Online_Ofline_View_Model()),
        ChangeNotifierProvider(create: (_) => Puja_Confirm_OTP()),
        ChangeNotifierProvider(
            create: (_) => Check_Booking_Confirm_OTP_View_Model()),
        ChangeNotifierProvider(create: (_) => Id_card_view_model_View()),
        ChangeNotifierProvider(create: (_) => Personal_Detail_View_Model()),
        ChangeNotifierProvider(create: (_) => Update_Bank_VM()),
        ChangeNotifierProvider(create: (_) => Store_Bank_VM()),
        ChangeNotifierProvider(create: (_) => Personal_Detail_View_Model()),
        ChangeNotifierProvider(create: (_) => Edit_profile_View_model()),
        ChangeNotifierProvider(create: (_) => Earnings_Home_VM()),
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
          primaryColor: kPrimaryColor,
          appBarTheme: AppBarTheme(color: kPrimaryColor)),
      home: SplashScreen(),
      // home: Name_Screen(),
    );
  }
}
