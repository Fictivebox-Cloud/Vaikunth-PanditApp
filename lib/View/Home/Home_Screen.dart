import 'package:flutter/material.dart';
import 'package:panditapp/View/Booking/Bookings_screen.dart';
import 'package:panditapp/View/Earning/Earnings.dart';
import 'package:panditapp/View/Home/Pages/home_page.dart';
import 'package:panditapp/View/Profile/Profile.dart';


import '../../Consts/color1.dart';
import '../../consts/image_const.dart';
import '../Booking/pages/Booking_Details.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {


  int currentIndex =0;

  final screen =[
    Home_page_Screen(),
    Earnings_Screen(),
    const Bookings_Screen(),
    Profile_Screen(),


  ];

  @override
  Widget build(BuildContext context) {


    return
      WillPopScope(
        onWillPop: () =>_onBackButtonPressed(context),
        child: Scaffold(
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
                      icon: Image.asset(ImageConst().HOME)
                      ,label: "Home"

                  ),
                  BottomNavigationBarItem(
                      icon: Image.asset(ImageConst().EARNING)
                      ,label: "Earnings"

                  ),
                  BottomNavigationBarItem(
                      icon: Image.asset(ImageConst().BOOKING)
                      ,label: "Bookings"

                  ),
                  BottomNavigationBarItem(
                      icon: Image.asset(ImageConst().PROFILE)
                      ,label: "Profile"



                  )


                ]
            )


        ),
      );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async{

    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context){
          return
            AlertDialog(

              title: Text("Vaikunth",style: TextStyle(color: Color(0XFFFF7D33))),
              content: Text("Do you want to Exit ?",style: TextStyle(color: Colors.black),),
              actions: [
                // ElevatedButton(
                //     onPressed:(){
                //   Navigator.of(context).pop(false);
                // },
                //     child: Text("Hello")),


                TextButton(

                    onPressed: (){
                      Navigator.of(context).pop(false);
                    },
                    child: Text("No",style: TextStyle(color: Colors.black),)),

                TextButton(
                    onPressed: (){
                      Navigator.of(context).pop(true);
                    },
                    child: Text("Yes",style: TextStyle(color: Colors.black))),
              ],
            );
        }
    );
    return exitApp ?? false;
  }

}