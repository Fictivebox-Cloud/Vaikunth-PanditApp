import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Help&Support.dart';
class Setting_Screen extends StatefulWidget {
  const Setting_Screen({Key? key}) : super(key: key);

  @override
  State<Setting_Screen> createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  var ht, wt;
  Color kPrimaryColor = const Color(0xffFF7D33);
  Color kSecondaryColor = const Color(0xffCACACA);
  Color kScaffoldBackground = const Color(0xffFFF3E9);
  Color p1Color = const Color(0xff6E798C);
  Color white = const Color(0xffFFFFFF);
  Color h1Color = const Color(0xff343D48);
  Color buttonColor = const Color(0xff109D03);
  Color b1Color =const Color(0xff6363BE);


  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text("Setting"),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 32),
            child: Column(
              children: [

                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      color: white,

                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 1,
                          color: kSecondaryColor

                      ),


                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(

                            children: [
                              Image.asset("assets/images/profile-privacy.png"),
                               Text("Privacy Policy",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w500,color: h1Color),),


                            ],

                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      color: white,

                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 1,
                          color: kSecondaryColor

                      ),


                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(

                            children: [
                              Image.asset("assets/images/terms-and-conditions.png"),
                              Text("Terms & Conditions",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w500,color: h1Color),),


                            ],

                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Help_Support_Screen()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      color: white,

                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 1,
                          color: kSecondaryColor

                      ),


                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(

                            children: [
                              Image.asset("assets/images/help.png"),
                              Text("Help & Support",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w500,color: h1Color),),


                            ],

                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
