import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Consts/text_const.dart';
import '../../../consts/themescolor.dart';
import '../../../view_model/BookingViewDetails/ViewDetails_VM.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';




class BookingProgress extends StatefulWidget {
  var bookingId;

  BookingProgress({Key? key, this.bookingId}) : super(key: key);

  @override
  State<BookingProgress> createState() => _BookingProgressState();
}

class _BookingProgressState extends State<BookingProgress> {
  var ht, wt;
  late ViewDetailVM viewdetailVM;


  @override
  Widget build(BuildContext context) {
     viewdetailVM = context.watch<ViewDetailVM>();

    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Appbar(),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      BookingStatus(),
                      DetailPage(),
                      SizedBox(height: 20,),
                      Button(),
                    SizedBox(height: 20,),

                    /*  Expanded(
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
                      ),*/

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Appbar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3,left: 16,right: 16,top: 10),
      child: Row (children: [
        InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: SvgPicture.asset("assets/images/lefticon.svg")),
     SizedBox(width: 12,),
        Text(BOOKINGID+" #${viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].orderId.toString()}", style: GoogleFonts.lato(
            fontSize: 18,
            color: h1Color,
            fontWeight: FontWeight.w600),),
        Spacer(),
        Icon(Icons.more_vert),

      ],),
    );
  }
  
  Widget BookingStatus(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text("Booking Status",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,),),
      SizedBox(height: 24,),
      Text("Reached customer location",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,),),
      SizedBox(height: 24,),
      Text("Puja Started",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,),),
          SizedBox(height: 24,),
      Text("Puja in progress",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,),),
          SizedBox(height: 24,),
      Text("Puja completed",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,),),
          SizedBox(height: 24,),

    ],),);
  }

  Widget DetailPage() {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top:17),
      height: 478,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
          border: Border.all(color:Color(0xffF5F5F5))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pooja time",style: GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 14),),
          SizedBox(height: 6,),
          Text(viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].bookingPujaDate.toString(),style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14,color: Color(0xff7C7C7C)),
            //.split(" ")[0]
          ),
          SizedBox(height: 22,),
          Text("Location",style: GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 14),),
          SizedBox(height: 6,),

          Text(viewdetailVM.viewdetailmodel!.response!
              .viewdetaildata![0].cityname.toString(),style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14,color: Color(0xff7C7C7C)),),
          SizedBox(height: 24,),
          Divider(),
          SizedBox(height: 17,),
          Text("Pooja type",style: GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 16),),
          SizedBox(height: 12,),
          Text(
            " ${viewdetailVM.viewdetailmodel!.response!
                .viewdetaildata![0].poojaTitle
                .toString()}",style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14,color:Color(0xff343D48)),),
          SizedBox(height: 12,),
          Text("Puranmashi katha(Offline)",style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14,color:Color(0xff343D48)),),
          SizedBox(height: 24,),
          Divider(),
          SizedBox(height: 16,),
          Text("Payment Billing",style: GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 16),),
          SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(PUJAEARNING,style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14),),
              Text("₹${viewdetailVM.viewdetailmodel!.response!
                  .viewdetaildata![0].bookingPaidAmount
                  .toString()}",
                style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14),),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(VISITING_CHARGE,style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14),),
              Text("₹200",style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14,color: Color(0xffFE0042)),),

              // Text("₹200")
            ],
          ),
          Divider(color: Color(0xffE2E2E2),),
          SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(TOTAL, style: GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 16),),
              Text("₹${viewdetailVM.viewdetailmodel!.response!
                  .viewdetaildata![0].bookingPaidAmount
                  .toString()}",
                style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14),

              ),
            ],
          )
        ],),);

  }


  Widget Button(){
    return  InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(4)),
        child: Center(
            child: Text(
              DONE,
              style: GoogleFonts.lato(
                  color: white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            )),
      ),
    );
  }
}
