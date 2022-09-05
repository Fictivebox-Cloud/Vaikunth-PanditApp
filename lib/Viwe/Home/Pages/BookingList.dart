



import 'package:provider/provider.dart';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:panditapp/Services/remote_bookinglist.dart';


import '../../../Consts/colors.dart';
import '../../../Services/Accept_Booking_Api.dart';




class BookingListTitl extends StatelessWidget {


  int index;
  bool _isLoading =false;

  BookingListTitl({required this.index});


  //late final BookingModel bookingModel;


  @override
  Widget build(BuildContext context) {
    return Consumer<RemoteBookinglist>(builder: (_, data, __) {


      

      return Container(
        child:  _isLoading ?  Center(
          child: CircularProgressIndicator() ):
            SingleChildScrollView(
            child:
            Column(
            children: [
            Padding(
        padding: const EdgeInsets.only(
        left: 16, right: 16, top: 50),
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
                              Text(data.bookingModel.response
                                  ?.bookinglist![index].bookingPujaDate ??
                                  '',
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight
                                        .w600,
                                    color: blackColor
                                ),),
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
                          data.bookingModel.response?.bookinglist![index]
                              .hostname ?? '',
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
                            '${data.bookingModel.response
                                ?.bookinglist![index].poojaTitle}',
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: h1Color),),
                        ),
                        SizedBox(height: 4,),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16),
                          child: Text('${data.bookingModel.response?.bookinglist![index].address}',
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

                          "Total Earnings:  ${data.bookingModel.response?.bookinglist![index]
                              .totalEarning}",

                          style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: h1Color),))
                        , Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 10),
                          child: InkWell(
                            onTap: () {

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

                                        Accept_Booking_Api ss = Accept_Booking_Api();
                                        ss.fachingApiAcceptBooking(
                                          // samplelist.removeAt(index)

                                        );
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
                      "Accept booking in ${data.bookingModel.response
                          ?.bookinglist![index].time}",
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
      ),


      );
    }
    );
  }

}