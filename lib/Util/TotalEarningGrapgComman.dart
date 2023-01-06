import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';

import '../Consts/themescolor.dart';
import '../view_model/home_tab/Online_Ofline_view_model.dart';
import '../view_model/home_tab/booking_request_view_model.dart';
class TotalEarningGraph extends StatefulWidget {
  const TotalEarningGraph({Key? key}) : super(key: key);

  @override
  State<TotalEarningGraph> createState() => _TotalEarningGraphState();
}

class _TotalEarningGraphState extends State<TotalEarningGraph> {
  late OnlineOflineViewModel _online_ofline_view_model;
  late BookingRequestViewModel booking_request_view_model;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 16,right: 16,top: 1),
      height: 168,
      //width: d,
      decoration: BoxDecoration(
          color: Color(0xFFffffff),
          boxShadow: [
            BoxShadow(
              color: Color(0xffFFD1CC),
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 8.0, //extend the shadow
              // offset: Offset(
              //   1.0, // Move to right 5  horizontally
              //   5.0, // Move to bottom 5 Vertically
              // ),
            )
          ],

          //border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                // color: Colors.blue,
                height:62 ,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Earning",style: GoogleFonts.lato(fontSize:14,fontWeight: FontWeight.w400,color:Color(0xff7C7C7C)),),
                    Spacer(),
                    Text("₹20000.00",style: GoogleFonts.lato(fontSize:24,fontWeight: FontWeight.w700),),
                  ],
                ),
              ),
            ),
            //Spacer(),
            SizedBox(width: 16,),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: double.infinity,
                height: 62,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Duty",style: GoogleFonts.lato(fontSize:14,fontWeight: FontWeight.w400,color:Color(0xff7C7C7C)),),
                    Spacer(),
                    SizedBox(
                      height: 31,
                      width: 120,
                      child: LiteRollingSwitch(
                        textOn: "Working",
                        value: true,
                        textOff: "Ofline",
                        colorOn: btn,
                        colorOff: p1Color,
                        textSize: 16,
                        onChanged: (val) {
                          _online_ofline_view_model =
                              Provider.of<OnlineOflineViewModel>(context,
                                  listen: false);
                          _online_ofline_view_model.getonlineofline(
                              userStatus: val ? "1" : "0");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],),
          Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffE2FFF3),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                height: 62,
                width: double.infinity,
                //color: Colors.red,
                child: Column(
                  children: [
                    Text("today Earn"),
                    Text("700"),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16,),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffFFD1CC),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                height: 62,
                width: double.infinity,
                //color: Colors.orangeAccent,
                child: Column(
                  children: [
                    Text("Total Visits"),
                    Text("100"),

                  ],
                ),
              ),
            ),
          ],),



        ],),
    );
  }
}

