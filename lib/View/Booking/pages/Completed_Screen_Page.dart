import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../model/Booking Model/Completd_Booking_Model.dart';
import '../../../Consts/colors.dart';


class Completed_Screen_Page extends StatefulWidget {
  const Completed_Screen_Page({Key? key}) : super(key: key);

  @override
  State<Completed_Screen_Page> createState() => _Completed_Screen_PageState();
}

class _Completed_Screen_PageState extends State<Completed_Screen_Page> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, int index) {
          return Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: double.infinity,
                      height: 226,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                          Border.all(width: 1, color: kSecondaryColor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 19, right: 19, top: 10),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: kPrimaryColor,
                                    ),
                                    SizedBox(
                                      width: 11,
                                    ),
                                    Text(

                                      "14/02/2022",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: blackColor),
                                    ),
                                    // SizedBox(width: 105,),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.location_on, color: h1Color),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Center(
                              child: Text(
                                "Vikrant",
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: kPrimaryColor),
                              )),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 16, top: 2),
                            child: Text(
                              "Booking List",
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              "Puja",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: h1Color),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              "Noida",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: h1Color),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 10),
                            child: DottedLine(),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Center(
                              child: Text(
                                "250",
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: h1Color),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 10),
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: b1Color),
                              child: Center(
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "ViewEarnings",
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            color: white,
                                            fontWeight: FontWeight.w500),
                                      ))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },

        itemCount: 7,
      )

    );
  }
}
