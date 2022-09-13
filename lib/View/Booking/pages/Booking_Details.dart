import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/View/Booking/pages/Booking_Progress_Screen.dart';
import 'package:provider/provider.dart';
import '../../../Consts/color1.dart';
import '../../../view_model/ViewDetails_VM.dart';


class Booking_Details_Screen extends StatefulWidget {
  const Booking_Details_Screen({Key? key}) : super(key: key);

  @override
  State<Booking_Details_Screen> createState() => _Booking_Details_ScreenState();
}

class _Booking_Details_ScreenState extends State<Booking_Details_Screen> {

  //late ViewDetailVM viewdetailVM;
  var ht,wt;


  @override
  Widget build(BuildContext context) {
    ViewDetailVM viewdetailVM = context.watch<ViewDetailVM>();

    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,


      appBar: AppBar(
        title:  Text("Booking Details"),
      ),
       body: SafeArea(
         child: SingleChildScrollView(
           child:  Expanded(
             child: Column(
               children: [
                 Center(child: Padding(
                   padding: const EdgeInsets.only(top: 10),
                   child: Text("Booking Number",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 14,color: h1Color),),
                 )),
                 Text(viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].orderId.toString(),style: GoogleFonts.lato(fontSize: 18,color:h1Color,fontWeight: FontWeight.w500),)

                 ,Container(
                   width: double.infinity,
                   height: 40,
                   color: bgColor,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 16,right: 16),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].name.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: kPrimaryColor),),
                        InkWell(
                          onTap: (){
                            FlutterPhoneDirectCaller.callNumber("${viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].phone}");
                           // Text("Call Now${viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].phone}"

                                },
                          child: Container(
                            width: 140,
                            height: 32,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.call,color: kPrimaryColor,),
                                Text("Call Now"
                                  ,style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 14,color: kPrimaryColor),)
                              ],
                            ),
                          ),
                        )
                      ],
                     ),
                   ),
                 ),
                 SizedBox(height: 19,),
                 Padding(
                   padding: const EdgeInsets.only(left: 16,right: 16),
                   child: Column(
                     children: [
                       Row(
                         children: [
                           Icon(Icons.calendar_month,color: kPrimaryColor,),
                           SizedBox(width: 11,),
                           //Text("Mon 05/Oct/2021"),
                           Text(viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].bookingPujaDate.toString().split(" ")[0]),
                         ],
                       ),
                       SizedBox(height: 19,),
                       Row(
                         children: [
                           Icon(Icons.access_time,color: kPrimaryColor,),
                           SizedBox(width: 11,),
                           //Text("6 PM    "),
                           Text(viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].bookingPujaDate.toString().replaceRange(0, 11, "")),
                         ],
                       ),
                       SizedBox(height: 19,),
                       Row(
                         children: [
                           Icon(Icons.location_on,color: kPrimaryColor,),
                           SizedBox(width: 11,),
                           Text(viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].cityname.toString())
                         ],
                       )
                     ],
                   ),
                 ),
                 SizedBox(height: 26,),
                 Container(
                   width: double.infinity,
                   height: 40,
                   color: bgColor,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 16,top: 8),
                     child: Text("Items",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18,color: kPrimaryColor),),
                   ),
                 ),
                 SizedBox(height: 16,),
                 Padding(
                   padding: const EdgeInsets.only(left: 16),
                   child: Column(
                     children: [
                       Row(
                         children: [
                           Text("1 x ${viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].poojaTitle.toString()}",),
                         ],
                       ),
                       const SizedBox(
                         height: 16,
                       ),
                       Row(
                         children: const [
                           Text("2 x Astrology Session"),
                         ],
                       )
                     ],
                   ),
                 ),
                 const SizedBox(height: 24,),
                 Container(
                   width: double.infinity,
                   height: 40,
                   color: bgColor,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 16,top: 8),
                     child: Text("Earnings",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18,color: kPrimaryColor),),
                   ),
                 ),
                 const SizedBox(height: 24,),
                 Padding(
                   padding: const EdgeInsets.only(left: 16,right: 16),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children:  [
                           Text("Puja Earnings"),
                           Text("₹${viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].bookingPaidAmount.toString()}"),

                         ],
                       ),
                       const SizedBox(height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: const [
                           Text("Visiting Charge"),
                           Text("₹200")
                         ],
                       ),
                       const SizedBox(height: 10,),
                       const DottedLine(),
                       SizedBox(height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children:[
                           Text("Total",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                           Text("₹${viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].bookingPaidAmount.toString()}"),
                         ],
                       )
                     ],
                   ),
                 ),
                 SizedBox(height: 24,),
                 Padding(
                   padding: const EdgeInsets.only(left: 16,right: 16),
                   child: Container(
                     width: double.infinity,
                     height: 48,
                     decoration: BoxDecoration(

                         borderRadius: BorderRadius.circular(4)
                         ,border: Border.all(
                         width: 2,
                         color: buttonColor
                     )
                     ),
                     child:
                     Center(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.navigation,color: buttonColor,),
                           Text("Navigate",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: buttonColor),)
                         ],
                       ),
                     ),
                   ),
                 ),
                 SizedBox(height: 24,),
                 Padding(
                   padding: const EdgeInsets.only(left: 16,right: 16),
                   child: InkWell(
                     onTap: (){
                       showModalBottomSheet(
                         context: context,
                         builder: (builder)=> bottomSheet(),
                       );
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
                 )
               ],
             ),
           ),
         )
       ),
    );
  }



  Widget bottomSheet(){
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 480,
        margin:  const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter the 4 digit OTP",style: GoogleFonts.lato(color: kSecondaryColor,fontSize: 16,fontWeight: FontWeight.w500),)
            ,SizedBox(height: 12,),
            Text("Ask for 4 digit code received by the user on their mobile number",style:
              GoogleFonts.lato(color: h1Color,fontSize: 14,fontWeight: FontWeight.w600),),
            SizedBox(height: 12,),
            Form(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          width: 1,
                          color: kSecondaryColor
                      )
                  ),
                  child: SizedBox(width: 48,
                    height: 48,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      style: TextStyle(color:h1Color),
                      decoration: InputDecoration(fillColor: kSecondaryColor),
                    ),),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          width: 1,
                          color: kSecondaryColor
                      )
                  ),
                  child: SizedBox(width: 48,
                    height: 48,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      style: TextStyle(color:h1Color),
                      decoration: InputDecoration(fillColor: kSecondaryColor),
                    ),),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          width: 1,
                          color:
                          kSecondaryColor
                      )
                  ),
                  child: SizedBox(width: 48,
                    height: 48,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: h1Color),
                      decoration: InputDecoration(fillColor: kScaffoldBackground),
                    ),),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          width: 1,
                          color: kSecondaryColor
                      )
                  ),
                  child: SizedBox(width: 48,
                    height: 48,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      style: TextStyle(color:h1Color),
                      decoration: InputDecoration(fillColor:kScaffoldBackground),
                    ),),
                )
              ],
            )),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking_Progress()));
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
          ],
        ),


      ),
    );
  }
}
