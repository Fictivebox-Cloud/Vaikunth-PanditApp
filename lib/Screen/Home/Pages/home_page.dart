import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:panditapp/API/ApiCallHomePage.dart';
import 'package:panditapp/Screen/Home/Pages/Notifications_screen.dart';
import 'package:panditapp/Screen/Profile/Profile.dart';

import '../../../model/bookingModel.dart';



class Home_page_Screen extends StatefulWidget {
  ApiCallHomePage apiCallHomePage = Get.put(ApiCallHomePage());

   Home_page_Screen({Key? key}) : super(key: key);

  @override
  State<Home_page_Screen> createState() => _Home_page_ScreenState();
}

class _Home_page_ScreenState extends State<Home_page_Screen> {
  var ht,wt;
  Color kPrimaryColor = const Color(0xffFF7D33);
  Color kSecondaryColor = const Color(0xffCACACA);
  Color kScaffoldBackground = const Color(0xffFFF3E9);
  Color p1Color =  const Color(0xff6E798C);
  Color white = const Color(0xffFFFFFF);
  Color h1Color =const Color(0xff343D48);
  Color buttonColor = const Color(0xff109D03);


  var isLoading =true.obs;
  var booking = <BookingModel>[].obs;

 


  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_Screen()));
                   },
                   child: Container(
                     child: CircleAvatar(
                      radius: 20,
                      backgroundImage:
                      NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80'),
                      backgroundColor: Colors.transparent,
                ),
                   ),
                 ),
                SizedBox(
                  height: 31,
                  width: 120,
                  child: LiteRollingSwitch(
                    value: true,
                    textOn: "Online",
                    textOff: "Ofline",
                    colorOn: const Color(0xff109D03),
                    colorOff: const Color(0xff6E798C),

                    textSize: 16,
                    onChanged: (bool  position){
                      print("The Vikrant $position");
                    },
                  ),

                ),
                InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications_screen()));
                 },
                  child: const Icon(

                      Icons.notifications),
                )
              ],
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/vector.png",),
                const SizedBox(width: 10,),
                Text("Welcome to Vaikunth",
                  style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w800,
                      color: kPrimaryColor ),)
              ],
            ),
            const SizedBox(
              height: 18,
            ),
             Padding(
               padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
               child: Text('Bookings Request',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: h1Color
                ),
            ),
             ),

            Expanded(
              child: ListView.builder(itemBuilder: (context, int index) {
                return
                  SingleChildScrollView(
                  child:
                  Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 10),
                        child:
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  width: double.infinity,
                                  height: 275,
                                  decoration: BoxDecoration(
                                      color: h1Color,
                                      borderRadius: BorderRadius.circular(10)
                                      , border: Border.all(
                                      width: 1,
                                      color: kSecondaryColor
                                  )
                                  ),
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    width: double.infinity,
                                    height: 239,
                                    decoration: BoxDecoration(
                                      color: white,
                                      //borderRadius: BorderRadius.all(r),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),

                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 19, right: 19, top: 10),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Icon(Icons.calendar_month,
                                                color: kPrimaryColor,),
                                              // SizedBox(width: 11,),
                                              Text("Mon 05/Oct/2021",
                                                style: GoogleFonts.lato(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff232323)),),
                                              // SizedBox(width: 105,),
                                              GestureDetector(
                                                  onTap: () {
                                                    print("Vikrant");
                                                  },
                                                  child: Icon(Icons.location_on,
                                                    color: kPrimaryColor,)),
                                              // SizedBox(width: 19.32,),
                                              IconButton(
                                                  onPressed: () {

                                                  },
                                                  icon:
                                                  Image.asset(
                                                      "assets/images/manu.png")


                                              ),

                                            ],

                                          ),


                                        ),
                                        SizedBox(height: 3,),
                                        Center(child: Text(
                                          "Vikrant Bhawani saini",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                              color: kPrimaryColor),)),
                                        SizedBox(height: 3,),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16),
                                          child: Text("Booking List",
                                            style: GoogleFonts.lato(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),),
                                        ),
                                        SizedBox(height: 4,),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16),
                                          child: Text(
                                            "1 x Puranmashi katha(Offline)",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: h1Color),),
                                        ),
                                        SizedBox(height: 4,),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16),
                                          child: Text("1 x Astrology",
                                            style: GoogleFonts.lato(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: h1Color),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16, top: 10),
                                          child: DottedLine(


                                          ),
                                        ),
                                        SizedBox(height: 4,),
                                        Center(child: Text(
                                          "Total Earnings: ₹568",
                                          style: GoogleFonts.lato(fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: h1Color),))
                                        , Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16, top: 10),
                                          child: InkWell(
                                            onTap: ()
                {
                                           ApiCallHomePage.fetchBooking();
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(7),
                                                  color: buttonColor
                                              ),
                                              child: Center(child: TextButton(
                                                  onPressed: () {

                                                  },
                                                  child: Text("Accept Booking",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 16,
                                                        color: white,
                                                        fontWeight: FontWeight
                                                            .w500),))),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text("Accept booking in 04:59:59",
                                      style: GoogleFonts.lato(fontSize: 16
                                          ,
                                          fontWeight: FontWeight.w600,
                                          color: white
                                      ),),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                    //Text("data")
                  ),
                );
              },
                itemCount: 5,
              ),
            ),














          ],
        ),
      ),

    );
  }






  }

