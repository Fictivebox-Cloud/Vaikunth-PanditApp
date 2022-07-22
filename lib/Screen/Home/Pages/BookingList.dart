import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../API/ApiCallHomePage.dart';
import '../../../model/BookingModel.dart';

class BookingListTitl extends StatelessWidget {






  Color kPrimaryColor = const Color(0xffFF7D33);
  Color kSecondaryColor = const Color(0xffCACACA);
  Color kScaffoldBackground = const Color(0xffFFF3E9);
  Color p1Color = const Color(0xff6E798C);
  Color white = const Color(0xffFFFFFF);
  Color h1Color = const Color(0xff343D48);
  Color buttonColor = const Color(0xff109D03);



  late final BookingModel bookingModel;

  final ApiCallHomePage _apiCallHomePage= Get.put(ApiCallHomePage());



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          borderRadius: BorderRadius.circular(
                              10)
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
                                        fontWeight: FontWeight
                                            .w600,
                                        color: Color(
                                            0xff232323)),),
                                  // SizedBox(width: 105,),
                                  GestureDetector(
                                      onTap: () {
                                        print("Vikrant");
                                      },
                                      child: Icon(
                                        Icons.location_on,
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
                                    fontWeight: FontWeight
                                        .w600),),
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
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: h1Color),))
                            , Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 10),
                              child: InkWell(
                                onTap: () {
                                  ApiCallHomePage();
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius
                                          .circular(7),
                                      color: buttonColor
                                  ),
                                  child: Center(
                                      child: TextButton(
                                          onPressed: () {

                                          },
                                          child: Text(
                                            "Accept Booking",
                                            style: GoogleFonts
                                                .lato(
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
                        child: Text(
                          "Accept booking in 04:59:59",
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
  }
}

