import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Services/Complete_Bookings.dart';
import '../../../model/Completd_Booking_Model.dart';

class Completed_Screen_Page extends StatefulWidget {
  const Completed_Screen_Page({Key? key}) : super(key: key);

  @override
  State<Completed_Screen_Page> createState() => _Completed_Screen_PageState();
}

class _Completed_Screen_PageState extends State<Completed_Screen_Page> {
  @override
  void initState() {
    Completed_Booking_Api ss =
        Provider.of<Completed_Booking_Api>(context, listen: false);
    ss.completedBookingData();
  }

  Color kPrimaryColor = const Color(0xffFF7D33);
  Color kSecondaryColor = const Color(0xffCACACA);
  Color kScaffoldBackground = const Color(0xffFFF3E9);
  Color p1Color = const Color(0xff6E798C);
  Color white = const Color(0xffFFFFFF);
  Color h1Color = const Color(0xff343D48);
  Color buttonColor = const Color(0xff109D03);
  Color b1Color = const Color(0xff6363BE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Completed_Booking_Api?>(
        builder: (_, data, __) {
          return ListView.builder(
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
                                          "datra",
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff232323)),
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
                                "Vikrant Bhawani saini",
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
                                  "1 x Puranmashi katha(Offline)",
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
                                  "1 x Astrology",
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
                                "Total Earnings: ₹568",
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
            itemCount:
                data!.compledBookingModel.response!.compbookinglist!.length,
          );
        },
      ),
    );
  }
}
