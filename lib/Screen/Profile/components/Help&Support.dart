import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Help_Support_Screen extends StatefulWidget {
  const Help_Support_Screen({Key? key}) : super(key: key);

  @override
  State<Help_Support_Screen> createState() => _Help_Support_ScreenState();
}

class _Help_Support_ScreenState extends State<Help_Support_Screen> {

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
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text("Help & Support"),
      ),
      body: SafeArea(
        child: Padding(

          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
          child: Column(
            children: [
              Expanded(

                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Column(
                      children: [
                             Center(
                               child: Text("For any help, please contact on below details",style: GoogleFonts.lato(
                                 fontWeight: FontWeight.w400,
                                 fontSize: 16,
                               ),
                               ),
                             ),
                             SizedBox(
                               height: 68,
                             ),
                             Icon(Icons.phone,color: kPrimaryColor,),
                             Text("+91 7704087638"),
                        SizedBox(
                          height: 72.33,
                        ),
                            Icon(Icons.mail,color: kPrimaryColor,),
                            Text("Support@vaikunth.com")
                      ],
                    ),
                  ),
                ),
              ),
              Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Center(
                      child: Row(

                        children: [
                          Icon(Icons.mail,color: kPrimaryColor,),
                          SizedBox(width: 10,),
                          Text("Send Email",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w500,color: h1Color),),


                        ],

                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                 color: kPrimaryColor,

                  borderRadius: BorderRadius.circular(8),







                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(

                        children: [
                          Icon(Icons.call,color: white,),
                          SizedBox(width: 10,),
                          Text("Call Now",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w500,color: white),),


                        ],

                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),



      ),
    );
  }
}
