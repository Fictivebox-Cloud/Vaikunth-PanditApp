import 'package:flutter/material.dart';
import 'package:panditapp/View/Booking/Bookings_screen.dart';
import 'package:panditapp/View/Earning/Earnings.dart';
import 'package:panditapp/View/Home/Pages/home_page.dart';
import 'package:panditapp/View/Profile/Profile.dart';
import 'package:provider/provider.dart';
import '../../Consts/text_const.dart';
import '../../consts/image_const.dart';
import '../../consts/themescolor.dart';
import '../../view_model/Earnings_View_Model/Earnings_Home_VM.dart';
import '../../view_model/home_tab/booking_request_view_model.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int currentIndex = 0;
  final screen = [
    Home_page_Screen(),
    Earnings_Screen(),
    Bookings_Screen(),
    Profile_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    Booking_Request_View_Model booking_request_view_model=
    Provider.of(context,listen: false);
    booking_request_view_model.getbookingApiCall();

    Earnings_Home_VM? earninghome =
    Provider.of<Earnings_Home_VM?>(context,
        listen: false);
    earninghome?.earningshomeAPIcall();

    return  WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
          backgroundColor: white,
          body: screen[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: kPrimaryColor,
              iconSize: 30,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(ImageConst().HOME), label: HOME),
                BottomNavigationBarItem(
                    icon: Image.asset(ImageConst().EARNING), label: EARNING),
                BottomNavigationBarItem(
                    icon: Image.asset(ImageConst().BOOKING), label: BOOKINGS),
                BottomNavigationBarItem(
                    icon: Image.asset(ImageConst().PROFILE), label: PROFILE)
              ])),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(VAIKUNTH, style: TextStyle(color: Color(0XFFFF7D33))),
            content: Text(
              DO_YOU_WANT_TO_EXIT,
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    NO,
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(YES, style: TextStyle(color: Colors.black))),
            ],
          );
        });
    return exitApp ?? false;
  }
}
