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
  BookingRequestViewModel? booking_request_view_model;

  BookingListTitl(this.booking_request_view_model);

  @override
  State<BookingListTitl> createState() => _BookingListTitlState();
}

class _BookingListTitlState extends State<BookingListTitl> {
  AcceptBookingApi? accept_bookingapi;

  bool isRejectBooking = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingRequestViewModel>(
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

  _ui(BookingRequestViewModel? booking_request_view_model,
      BuildContext context) {
    return booking_request_view_model!
                .getbookinglistModel?.response!.bookinglist!.length ==
            0
        ? Container(
            //height: 500,
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
                child: Container(
                  width: double.infinity,
                  height: 213,
                  decoration:  BoxDecoration(
                    //color: Colors.red,
                   border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(35)),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(
                          height: 4,
                        ),
                        Text(
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
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(BOOKING_NO+"#098767",
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              color:Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          booking_request_view_model
                              .getbookinglistModel!
                              .response!
                              .bookinglist![index]
                              .bookingPujaDate
                              ??"",
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
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

                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          BOOKING_BY +
                              "Govind kumar",
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: h1Color),
                        ),

                        SizedBox(height: 15,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              //width:double.infinity,
                              height: 36,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  //color: buttonColor
                              ),
                              child: Center(
                                  child: Text(
                                      booking_request_view_model
                                          .getbookinglistModel!
                                          .response!
                                          .bookinglist![index]
                                          .bookingPujaDate.toString()
                                          .split(" ")[1]
                                          ??"" ,
                                   // "03:56",
                                    style: GoogleFonts.lato(
                                        fontSize: 18,
                                        color: kPrimaryColor,
                                        fontWeight:
                                        FontWeight.w900),
                                  )),
                            ),

                        InkWell(
                                onTap: () {
                                  setState(() {
                                    Utils.toastMessage("rejected");
                                   // Utils.toastMessage(REJECTED_BOOKING);
                                                    RejectBookingVM rejectbooking =
                                                    Provider.of<RejectBookingVM>(context,
                                                        listen: false);
                                                    rejectbooking.Reject_booking_Apicall(userbooking: booking_request_view_model.getbookinglistModel!.response!.bookinglist?[index].bookingId.toString() ?? "");

                                                    booking_request_view_model.getbookinglistModel!.response!.bookinglist!.removeAt(index);

                                  });
                                },
                                child:
                                Container(
                                  width:90,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xffF5F5F5)),
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      //color: Colors.white
                                  ),
                                  child: Center(
                                      child: Text(
                                        "Reject",
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            color: dividerr,
                                            fontWeight:
                                            FontWeight.w500),
                                      )),
                                )),



                            booking_request_view_model.loading
                                ? Container(
                              child: const Center(
                                  child:
                                  CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  )),
                            )
                                :
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    Utils.toastMessage(ACCEPT_BOOKING);
                                    accept_bookingapi = Provider.of<AcceptBookingApi>(context,listen: false);
                                    accept_bookingapi?.getAccept_booking_Api(userbooking: booking_request_view_model.getbookinglistModel!.response!.bookinglist?[index].bookingId.toString() ?? "");

                                    CompleteBookingViewModel completeBookingViewModel =
                                    Provider.of<CompleteBookingViewModel>(context, listen: false);
                                    completeBookingViewModel.completebookingAPIcall();

                                    booking_request_view_model.getbookinglistModel!.response!.bookinglist!.removeAt(index);
                                  });
                                },
                                child:
                                Container(
                                  width:90,
                                  height: 36,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      color: Color(0xfff5f5f5)
                                  ),
                                  child: Center(
                                      child: Text(
                                        ACCEPT,
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            color: kPrimaryColor,
                                            fontWeight:
                                            FontWeight.w500),
                                      )),
                                )),


                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       left: 16, right: 16, top: 10),
                            //   child: booking_request_view_model.loading
                            //       ? Container(
                            //     child: const Center(
                            //         child:
                            //         CircularProgressIndicator(
                            //           color: kPrimaryColor,
                            //         )),
                            //   )
                            //       : InkWell(
                            //       onTap: () {
                            //         setState(() {
                            //           Utils.toastMessage(ACCEPT_BOOKING);
                            //           accept_bookingapi = Provider.of<AcceptBookingApi>(context,listen: false);
                            //           accept_bookingapi?.getAccept_booking_Api(userbooking: booking_request_view_model.getbookinglistModel!.response!.bookinglist?[index].bookingId.toString() ?? "");
                            //
                            //           CompleteBookingViewModel completeBookingViewModel =
                            //           Provider.of<CompleteBookingViewModel>(context, listen: false);
                            //           completeBookingViewModel.completebookingAPIcall();
                            //
                            //           booking_request_view_model.getbookinglistModel!.response!.bookinglist!.removeAt(index);
                            //         });
                            //       },
                            //       child: Container(
                            //         width: double.infinity,
                            //         height: 48,
                            //         decoration: BoxDecoration(
                            //             borderRadius:
                            //             BorderRadius.circular(
                            //                 7),
                            //             color: buttonColor),
                            //         child: Center(
                            //             child: Text(
                            //               ACCEPT_BOOKING,
                            //               style: GoogleFonts.lato(
                            //                   fontSize: 16,
                            //                   color: white,
                            //                   fontWeight:
                            //                   FontWeight.w500),
                            //             )),
                            //       )),
                            // )

                        ],),



                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: booking_request_view_model
                .getbookinglistModel?.response!.bookinglist!.length ?? 0,
          );
  }
}
