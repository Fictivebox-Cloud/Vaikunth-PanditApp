import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Consts/image_const.dart';
import 'package:panditapp/View/Booking/pages/Booking_Details.dart';
import 'package:panditapp/Widgets/circular_loader.dart';
import 'package:provider/provider.dart';

import '../../Consts/text_const.dart';
import '../../consts/themescolor.dart';
import '../../view_model/BookingViewDetails/Complete_Bookings.dart';
import '../../view_model/Profile/Bank Account Details/Delete_Bank_VM.dart';

class Bookings_Screen extends StatefulWidget {
  const Bookings_Screen({Key? key}) : super(key: key);

  @override
  State<Bookings_Screen> createState() => _Bookings_ScreenState();
}

class _Bookings_ScreenState extends State<Bookings_Screen> {
  late TabController _controller;
  var ht, wt;
  bool Small = false;

  late CompleteBookingViewModel completeBookingViewModel;
  Future<void> _refresh(bool reload, BuildContext context){
    completeBookingViewModel= Provider.of<CompleteBookingViewModel>(context,listen: false);
    completeBookingViewModel.completebookingAPIcall();
    return Future.delayed(const Duration(seconds: 0));


  }


  @override
  Widget build(BuildContext context) {
    completeBookingViewModel = Provider.of<CompleteBookingViewModel>(context,listen: false);
    completeBookingViewModel.completebookingAPIcall();

    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return

       Scaffold(
          backgroundColor: white,
          body: completeBookingViewModel.loading
              ? const Center(child: CircularLoader())
              : DefaultTabController(
            length: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  TabBar(
                    labelStyle: TextStyle(fontSize: Small ? 13.0 : 18.0),
                    labelColor: h1Color,
                    unselectedLabelColor: const Color(0Xff999EA3),
                    tabs: const [
                      Tab(
                        text: 'Upcoming',
                      ),
                      Tab(
                        text: 'Completed',
                      ),
                      Tab(
                        text: 'Cancelled',
                      ),
                    ],
                  ),
                  Expanded(
                      child: TabBarView(
                        children: [
                          Center(
                            child: Upcoming(),
                          ),
                          Center(
                            child: CompletedPage(),
                          ),
                          Center(
                              child: Cancelled()),
                        ],
                      ))
                ],
              ),
            ),),
    );
  }

  Widget Upcoming() {
    return RefreshIndicator(
      onRefresh: () async{
        await _refresh(true, context);
      },
      color: kPrimaryColor,
      strokeWidth: 5,
      displacement: 0,
      child: Container(
          child: ListView.builder(

            itemBuilder: (context, int index) {
              return Container(
                child: Column(
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
                                border: Border.all(width: 1, color: kSecondaryColor)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 19, right: 19, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            color: kPrimaryColor,
                                          ),
                                          const SizedBox(
                                            width: 11,
                                          ),
                                          Text(
                                            //"Mon 05/Oct/2021"
                                            completeBookingViewModel
                                                .completebokingmodel
                                                ?.response!
                                                .upcomingbookinglist![index]
                                                .bookingPujaDate ??
                                                "",
                                            style: GoogleFonts.lato(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff232323)),
                                          ),
                                          // SizedBox(width: 105,),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: h1Color,
                                          ),
                                          const SizedBox(
                                            width: 19.32,
                                          ),
                                          Image.asset(ImageConst().MANU),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Center(
                                    child: Text(
                                      completeBookingViewModel
                                          .completebokingmodel
                                          ?.response!
                                          .upcomingbookinglist![index]
                                          .name ??
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
                                        fontSize: 14, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    "1 x ${completeBookingViewModel.completebokingmodel?.response!.upcomingbookinglist![index].poojaTitle ?? ""}",
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
                                    "1 x Astrology",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: h1Color),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                  EdgeInsets.only(left: 16, right: 16, top: 10),
                                  child: DottedLine(),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(TOTAL_EARNING),
                                    Text(
                                      "${completeBookingViewModel.completebokingmodel?.response!.upcomingbookinglist![index].bookingPaidAmount ?? ""}",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: h1Color),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 10),
                                  child: Container(
                                    width: double.infinity,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: buttonColor),
                                    child: Center(
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Booking_Details_Screen(
                                                              bookingId: completeBookingViewModel
                                                                  .completebokingmodel!
                                                                  .response!
                                                                  .upcomingbookinglist![index]
                                                                  .id.toString())));
                                            },
                                            child: Text(
                                              VIEW_DETAILS,
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
                ),
              );
            },
            itemCount: completeBookingViewModel
                .completebokingmodel?.response!.upcomingbookinglist!.length,
          )),
    );
  }

  Widget CompletedPage() {
    int index;

    return RefreshIndicator(
      onRefresh: () async{
        await _refresh(true, context);
      },
      color: kPrimaryColor,
      strokeWidth: 5,
      displacement: 0,
      child: ListView.builder(
        itemCount: completeBookingViewModel
            .completebokingmodel?.response!.compbookinglist!.length,
        itemBuilder: (context, int index) {
          return Container(
            child: Column(
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
                            border: Border.all(width: 1, color: kSecondaryColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 19, right: 19, top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        color: kPrimaryColor,
                                      ),
                                      const SizedBox(
                                        width: 11,
                                      ),
                                      Text(
                                        //"Mon 05/Oct/2021",
                                        completeBookingViewModel
                                            .completebokingmodel!
                                            .response!
                                            .compbookinglist![index]
                                            .poojaDate.toString() ??
                                            "",
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff232323)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(Icons.location_on,
                                          color: h1Color),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Center(
                                child: Text(
                                  completeBookingViewModel
                                      .completebokingmodel!
                                      .response!
                                      .compbookinglist![0]
                                      .hostname ??
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
                              padding: const EdgeInsets.only(left: 16, top: 2),
                              child: Text(
                                BOOKING_LIST,
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                "1 x ${completeBookingViewModel.completebokingmodel!.response!.compbookinglist![index].poojaTitle ?? ""}",
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
                                "1 x Astrology",
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: h1Color),
                              ),
                            ),
                            const Padding(
                              padding:
                              EdgeInsets.only(left: 16, right: 16, top: 10),
                              child: DottedLine(),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(TOTAL_EARNING),
                                Text(
                                  "${completeBookingViewModel.completebokingmodel!.response!.compbookinglist![index].totalEarning ?? ""}",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: h1Color),
                                ),
                              ],
                            ),
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
                                          VIEWEARNINGS,
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
            ),
          );
        },
        //itemCount: 5,

      ),
    );
  }

  Widget Cancelled() {
    return Container(
        child: RefreshIndicator(
          onRefresh: () async{
            await _refresh(true, context);
          },
          color: kPrimaryColor,
          strokeWidth: 5,
          displacement: 0,
          child: ListView.builder(

            itemCount: completeBookingViewModel
                .completebokingmodel?.response!.cancelbookinglist!.length,
            itemBuilder: (context, int index) {
              return Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: double.infinity,
                            height: 174,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1, color: kSecondaryColor)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 8, top: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            color: kPrimaryColor,
                                          ),
                                          const SizedBox(
                                            width: 11,
                                          ),
                                          Text(
                                            completeBookingViewModel
                                                .completebokingmodel
                                                ?.response!
                                                .cancelbookinglist![0]
                                                .bookingPujaDate ??
                                                "",
                                            //"Mon 05/Oct/2021",
                                            style: GoogleFonts.lato(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff232323)),
                                          ),
                                          // SizedBox(width: 105,),
                                        ],
                                      ),
                                      Container(
                                        height: 25,
                                        width: 108,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(CANCELLED,
                                                style:
                                                TextStyle(color: Colors.white))),
                                      )
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 8,
                                ),
                                Center(
                                    child: Text(
                                      completeBookingViewModel
                                          .completebokingmodel
                                          ?.response!
                                          .cancelbookinglist![index]
                                          .name ??
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
                                  padding: const EdgeInsets.only(left: 16, top: 16),
                                  child: Text(
                                    BOOKING_LIST,
                                    style: GoogleFonts.lato(
                                        fontSize: 14, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    "1 x ${completeBookingViewModel.completebokingmodel?.response!.cancelbookinglist![index].poojaTitle ?? ""}",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: h1Color),
                                  ),
                                ),
                                // SizedBox(height: 4,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, top: 4),
                                  child: Text(
                                    "1 x Astrology",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: h1Color),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            //itemCount: 20,

          ),
        ));
  }
}