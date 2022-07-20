import 'package:flutter/material.dart';
import 'package:panditapp/Screen/Booking/Bookings_screen.dart';
import 'package:panditapp/Screen/Earning/Earnings.dart';
import 'package:panditapp/Screen/Home/Pages/home_page.dart';
import 'package:panditapp/Screen/Profile/Profile.dart';

import '../Booking/pages/Booking_Details.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  Color kPrimaryColor = Color(0xffFF7D33);
  Color kSecondaryColor = Color(0xffCACACA);
  Color kScaffoldBackground = Color(0xffFFF3E9);
  Color p1Color =  Color(0xff6E798C);
  Color white = Color(0xffFFFFFF);
  Color h1Color =Color(0xff343D48);
  int currentIndex =0;

  final screen =[
    Home_page_Screen(),
    Earnings_Screen(),
    Bookings_Screen(),
    Profile_Screen(),


  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor:white,
       body: screen[currentIndex],


       bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index)=> setState(()=>currentIndex=index) ,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        iconSize: 30,
        items: [

          BottomNavigationBarItem(
              icon: Image.asset('assets/images/home.png')
              ,label: "Home"

          ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/earning.png')
              ,label: "Earnings"

          ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/booking.png')
              ,label: "Bookings"

          ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/profile.png')
              ,label: "Profile"



          )


        ]
       )


    );
  }
}
