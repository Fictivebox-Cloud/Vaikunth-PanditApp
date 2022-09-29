import 'package:panditapp/consts/image_const.dart';
import 'package:panditapp/view_model/home_tab/booking_request_view_model.dart';
import 'package:provider/provider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Consts/text_const.dart';
import '../../../Util/utils.dart';
import '../../../consts/themescolor.dart';
import '../../../view_model/BookingViewDetails/Complete_Bookings.dart';
import '../../../view_model/home_tab/Accept_Booking_Api.dart';
import '../../../view_model/home_tab/Reject_Booking_VM.dart';

class BookingListTitl extends StatefulWidget {
  Booking_Request_View_Model? booking_request_view_model;

  BookingListTitl(this.booking_request_view_model);

  @override
  State<BookingListTitl> createState() => _BookingListTitlState();
}

class _BookingListTitlState extends State<BookingListTitl> {
  Accept_Booking_Api? accept_bookingapi;

  bool isRejectBooking = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<Booking_Request_View_Model>(
      builder: (_, data, __) {
        if (data.loading) {
          return const Center(
              child: CircularProgressIndicator(
            color: kPrimaryColor,
          ));
        } else if (data.userError != null) {
          return Center(child: Text(data.userError!.message.toString()));
        }
        return _ui(widget.booking_request_view_model, context);
      },
    );
  }

  _ui(Booking_Request_View_Model? booking_request_view_model,
      BuildContext context) {
    return booking_request_view_model!
                .getbookinglistModel?.response!.bookinglist!.length ==
            0
        ? Container(
            height: 500,
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageConst().EMPTYS),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  NO_BOOKING_REQUESTS,
                  style: GoogleFonts.lato(color: kSecondaryColor, fontSize: 13),
                )
              ],
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Stack(
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
                      child: Stack(
                          alignment: Alignment.centerRight,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 239,
                            decoration: const BoxDecoration(
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
                                      const Icon(
                                        Icons.calendar_month,
                                        color: kPrimaryColor,
                                      ),
                                      // SizedBox(width: 11,),
                                      Text(
                                        booking_request_view_model
                                            .getbookinglistModel!
                                            .response!
                                            .bookinglist![index]
                                            .bookingPujaDate
                                            .toString(),
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: blackColor),
                                      ),
                                      // SizedBox(width: 105,),
                                      GestureDetector(
                                          onTap: () {
                                            print("Vikrant");
                                          },
                                          child: const Icon(
                                            Icons.location_on,
                                            color: kPrimaryColor,
                                          )
                                      ),




                                          PopupMenuButton(itemBuilder: (context) =>[
                                            PopupMenuItem( child:
                                            InkWell(
                                              onTap: (){
                                                Utils.toastMessage(REJECTED_BOOKING);

                                                Reject_Booking_VM rejectbooking =
                                                Provider.of<Reject_Booking_VM>(context,
                                                    listen: false);
                                                rejectbooking.Reject_booking_Apicall(userbooking: booking_request_view_model.getbookinglistModel!.response!.bookinglist?[index].bookingId.toString() ?? "");

                                                booking_request_view_model.getbookinglistModel!.response!.bookinglist!.removeAt(index);

                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(ImageConst().REJECT),
                                                  SizedBox(width: 8,),
                                                  Text("Reject Booking")
                                                ],
                                              ),
                                            ))
                                          ]

                                          ),

                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Center(
                                    child: Text(
                                      booking_request_view_model
                                          .getbookinglistModel!
                                          .response!
                                          .bookinglist![index]
                                          .poojaTitle ??
                                          "",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: kPrimaryColor),
                                    )),
                                const SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    BOOKING_LIST,
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    booking_request_view_model
                                        .getbookinglistModel!
                                        .response!
                                        .bookinglist![index]
                                        .poojaTitle ??
                                        "",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: h1Color),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    booking_request_view_model
                                        .getbookinglistModel!
                                        .response!
                                        .bookinglist![index]
                                        .cityname ??
                                        "",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: h1Color),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, right: 16, top: 10),
                                  child: DottedLine(),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Center(
                                    child: Text(
                                      TOTAL_EARNING +
                                          "${booking_request_view_model.getbookinglistModel!.response!.bookinglist![0].totalEarning ?? ""}",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: h1Color),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 10),
                                  child: booking_request_view_model.loading
                                      ? Container(
                                    child: const Center(
                                        child:
                                        CircularProgressIndicator(
                                          color: kPrimaryColor,
                                        )),
                                  )
                                      : InkWell(
                                      onTap: () {
                                        setState(() {
                                          Utils.toastMessage(ACCEPT_BOOKING);
                                          accept_bookingapi = Provider.of<Accept_Booking_Api>(context,listen: false);
                                          accept_bookingapi?.getAccept_booking_Api(userbooking: booking_request_view_model.getbookinglistModel!.response!.bookinglist?[index].bookingId.toString() ?? "");

                                          CompleteBookingViewModel completeBookingViewModel =
                                          Provider.of<CompleteBookingViewModel>(context, listen: false);
                                          completeBookingViewModel.completebookingAPIcall();

                                          booking_request_view_model.getbookinglistModel!.response!.bookinglist!.removeAt(index);
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                7),
                                            color: buttonColor),
                                        child: Center(
                                            child: Text(
                                              ACCEPT_BOOKING,
                                              style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  color: white,
                                                  fontWeight:
                                                  FontWeight.w500),
                                            )),
                                      )),
                                )
                              ],
                            ),
                          ),

                        ]
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          ACCEPT_BOOKING_IN +
                              "${booking_request_view_model.getbookinglistModel!.response!.bookinglist![index].time ?? ""}",
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: white),
                        ),
                      ),
                    ),

                  ],
                ),
              );
            },
            itemCount: booking_request_view_model
                .getbookinglistModel!.response!.bookinglist!.length,
          );
  }
}
