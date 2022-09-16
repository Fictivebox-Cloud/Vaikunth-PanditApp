import 'package:panditapp/model/Booking%20Model/Acept_Booking_Model.dart';
import 'package:panditapp/view_model/home_tab/booking_request_view_model.dart';
import 'package:provider/provider.dart';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Consts/color1.dart';
import '../../../view_model/Complete_Bookings.dart';
import '../../../view_model/home_tab/Accept_Booking_Api.dart';

class BookingListTitl extends StatefulWidget {
  Booking_Request_View_Model? booking_request_view_model;

  BookingListTitl(this.booking_request_view_model);

  @override
  State<BookingListTitl> createState() => _BookingListTitlState();
}

class _BookingListTitlState extends State<BookingListTitl> {


  Accept_Booking_Api? ss;

  @override
  Widget build(BuildContext context) {
    return Consumer<Booking_Request_View_Model>(
      builder: (_, data, __) {
        if (data.loading) {
          return const CircularProgressIndicator();
        } else if (data.userError != null) {
          return Center(
              child: Text(data.userError!.message.toString()));
        }
        return _ui(widget.booking_request_view_model, context);
      },
    );
  }

  _ui(Booking_Request_View_Model? booking_request_view_model,   BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, int index) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          width: double.infinity,
                          height: 275,
                          decoration: BoxDecoration(
                              color: h1Color,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: kSecondaryColor)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 19, right: 19, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: kPrimaryColor,
                                      ),
                                      // SizedBox(width: 11,),
                                      Text(booking_request_view_model!.getbookinglistModel!.response!.bookinglist![index].poojaDate ?? ""
                                        ,style: GoogleFonts.lato(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: blackColor),
                                      ),
                                      // SizedBox(width: 105,),
                                      GestureDetector(
                                          onTap: () {
                                            print("Vikrant");
                                          },
                                          child: Icon(
                                            Icons.location_on,
                                            color: kPrimaryColor,
                                          )),
                                      // SizedBox(width: 19.32,),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                              "assets/images/manu.png")),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Center(
                                    child: Text(
                                      booking_request_view_model.getbookinglistModel!.response!.bookinglist![index].poojaTitle ?? "",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: kPrimaryColor),
                                )),
                                SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
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
                                    booking_request_view_model.getbookinglistModel!.response!.bookinglist![index].poojaTitle ?? "",
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
                                    booking_request_view_model.getbookinglistModel!.response!.bookinglist![index].cityname ?? "",
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
                                  "Total Earnings:  ${booking_request_view_model.getbookinglistModel!.response!.bookinglist![index].totalEarning ?? ""}",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: h1Color),
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 10),
                                  child: InkWell(
                                    onTap: () {
                                      setState(()  {
                                        ss = Provider.of<Accept_Booking_Api>(context, listen: false);
                                         ss?.getAccept_booking_Api(userbooking: booking_request_view_model.getbookinglistModel!.response!.bookinglist![index].bookingId.toString() ?? "");

                                        CompleteBookingViewModel completeBookingViewModel = Provider.of<CompleteBookingViewModel>(context, listen: false);
                                         completeBookingViewModel.completebookingAPIcall();

                                        booking_request_view_model.getbookinglistModel!.response!.bookinglist!.removeAt(index);
                                      });

                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: buttonColor),
                                      child: Center(
                                          child: Text(
                                            "Accept Booking",
                                            style: GoogleFonts.lato(
                                                fontSize: 16,
                                                color: white,
                                                fontWeight:
                                                    FontWeight.w500),
                                          )),
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
                              "Accept booking in ${booking_request_view_model.getbookinglistModel!.response!.bookinglist![index].time ?? ""}",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },

      itemCount: booking_request_view_model!.getbookinglistModel!.response!.bookinglist!.length,
    );
  }
}
