

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nav_router/nav_router.dart';
import 'package:panditapp/Screen/login_flow/OTP_Verify.dart';
class PhoneNumber_Screen extends StatefulWidget {
  const PhoneNumber_Screen({Key? key}) : super(key: key);

  @override
  State<PhoneNumber_Screen> createState() => _PhoneNumber_ScreenState();
}

class _PhoneNumber_ScreenState extends State<PhoneNumber_Screen> {
  var ht,wt;
  Color kPrimaryColor = Color(0xffFF7D33);
  Color kSecondaryColor = Color(0xffCACACA);
  Color kScaffoldBackground = Color(0xffFFF3E9);
  Color p1Color =  Color(0xff6E798C);
  Color white = Color(0xffFFFFFF);
  Color h1Color =Color(0xff343D48);
  Color textFiledColor = Color(0xffCACACA);
  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:Color(0XFFFF7D33),
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
         child: Container(
           child: Column(
             children: [
               Expanded(
                 flex: 2,
                 child: Container(
                   height: double.infinity,
                   width: double.infinity,
                   color: Colors.white,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("Enter Your Phone Number",
                            style: GoogleFonts.lato(

                              fontWeight: FontWeight.w500,color: Colors.black,fontSize: 24),),
                        ),
                       Padding(
                         padding: const EdgeInsets.all(16.0),
                         child: textFiled(),
                       ),

                     ],
                   ),
               ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 16,right: 16,bottom: 24),
                 child: Container(

                   child: Container(
                     width: double.infinity,
                     height: 48,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(4),

                         color: kPrimaryColor
                     ),
                     child: FlatButton(


                         onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>OTP_verify()));


                         },
                         child: Text('Send OTP',style: GoogleFonts.lato(
                         color: white,fontSize: 24,
                         fontWeight: FontWeight.w600),)),
                   ),

                 ),
               )
             ],
           )),
         ),

    );
  }
  Widget textFiled(){
    return Container(
        height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: Colors.black
        )
      ),
      child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Image.network("https://media.istockphoto.com/vectors/flag-of-india-vector-id472317739?k=20&m=472317739&s=612x612&w=0&h=EyWmhj952ZyJEgDStLz3fd0WZjqYIpSvnK3OpPfJ4eA=",
              width: 30,
              height: 30,),
            ),
            SizedBox(width: 10,),
            Text("+91"),
            SizedBox(width: 5,),
            VerticalDivider(
              width: 2,
              color: kSecondaryColor,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter You Phone Number",
                    border: InputBorder.none,


                  ),
                ),
              ),
            )

          ],
      )
    );


  }
}
