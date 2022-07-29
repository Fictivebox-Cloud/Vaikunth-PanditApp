import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_change/status_change.dart';

class Booking_Progress extends StatefulWidget {
  const Booking_Progress({Key? key}) : super(key: key);

  @override
  State<Booking_Progress> createState() => _Booking_ProgressState();
}

class _Booking_ProgressState extends State<Booking_Progress> {
  var ht,wt;

  Color kPrimaryColor = const Color(0xffFF7D33);
  Color kSecondaryColor = const Color(0xffCACACA);
  Color kScaffoldBackground = const Color(0xffFFF3E9);
  Color p1Color =  const Color(0xff6E798C);
  Color white = const Color(0xffFFFFFF);
  Color h1Color =const Color(0xff343D48);
  Color buttonColor = const Color(0xff109D03);
  Color bgColor = const Color.fromRGBO
    (255, 125, 51, 0.15);
  @override
  Widget build(BuildContext context) {

    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(

      backgroundColor:white ,
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
                          padding: const EdgeInsets.only(left: 16,top: 12),
                          child: Center(
                            child: Row(

                              children: [
                                Icon(

                                  Icons.arrow_back,color: white,),
                                SizedBox(width: 64,),
                                Center(child: Text("Booking in Progress",style: GoogleFonts.lato(color: white , fontWeight: FontWeight.w600,fontSize: 18),)),

                              ],
                            ),

                          ),

                        ),

                      ),
                      SizedBox(height: 16,),
                      Text("Vikrant Bhawani", style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w500,color: white),)
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 16,top: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month,color: kPrimaryColor,),
                          SizedBox(width: 7,),
                          Text
                            ("Mon 05/Oct/2021",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 14),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.access_time,color: kPrimaryColor,),
                          SizedBox(width: 7,),
                          Text("6 PM",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500),)
                        ],

                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on,color: kPrimaryColor,),
                          SizedBox(width: 7,),
                          Text("Rally Infra Business Park, Sector 63, Noida, UP",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 14),)
                        ],
                      )

                    ],
                  ),
                ),
                SizedBox(height: 48,),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text("Booking Status",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600),),
                ),


              ],




            ),),
            Expanded(
              flex: 0,
              child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,bottom: 20),
              child: InkWell(
                onTap: (){

                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(4)

                  ),
                  child: Center(child: Text("Next ",style: GoogleFonts.lato(color: white,fontWeight: FontWeight.w600,fontSize: 20),)),
                ),
              ),
            ),)
          ],
        ),


      ),
    );
  }
}
