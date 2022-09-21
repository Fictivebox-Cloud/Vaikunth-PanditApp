import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Consts/color1.dart';
import '../../../Consts/text_const.dart';
import '../../../view_model/ViewDetails_VM.dart';

class Booking_Progress extends StatefulWidget {
  var bookingId;

  Booking_Progress({Key? key, this.bookingId}) : super(key: key);

  @override
  State<Booking_Progress> createState() => _Booking_ProgressState();
}

class _Booking_ProgressState extends State<Booking_Progress> {
  var ht, wt;

  @override
  Widget build(BuildContext context) {
    ViewDetailVM viewdetailVM = context.watch<ViewDetailVM>();

    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 80,
                    color: kPrimaryColor,
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 12),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color: white,
                                  ),
                                  SizedBox(
                                    width: 64,
                                  ),
                                  Center(
                                      child: Text(
                                    BOOKING_INPROGRESS,
                                    style: GoogleFonts.lato(
                                        color: white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          viewdetailVM.viewdetailmodel!.response!
                              .viewdetaildata![0].name
                              .toString(),
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              //"Mon 05/Oct/2021"
                              viewdetailVM.viewdetailmodel!.response!
                                  .viewdetaildata![0].bookingPujaDate
                                  .toString()
                                  .split(" ")
                                  .first,
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              viewdetailVM.viewdetailmodel!.response!
                                  .viewdetaildata![0].bookingPujaDate
                                  .toString()
                                  .replaceRange(0, 11, ""),
                              style: GoogleFonts.lato(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              viewdetailVM.viewdetailmodel!.response!
                                  .viewdetaildata![0].cityname
                                  .toString(),
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      BOOKING_STATUS,
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                        child: Text(
                      NEXT,
                      style: GoogleFonts.lato(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
