
import 'package:flutter/material.dart';


import 'package:panditapp/Services/verification_number_api.dart';





import 'package:panditapp/Services/CityListApi.dart';
import 'package:panditapp/Services/Complete_Bookings.dart';
import 'package:provider/provider.dart';

import 'Viwe/Splash_onboarding/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Services/Accept_Booking_Api.dart';
import 'Services/remote_bookinglist.dart';

Future<void>  main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RemoteBookinglist(),),
        ChangeNotifierProvider(create: (_) => City_List_Api(),),
        ChangeNotifierProvider(create: (_) => Accept_Booking_Api(),),
        ChangeNotifierProvider(create: (_) => Completed_Booking_Api(),),
        ChangeNotifierProvider(create: (_) => City_List_Api(),),
        ChangeNotifierProvider(create: (_) => Verification_Number_Api(),),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        home: SplashScreen(),
      );
  }

}

