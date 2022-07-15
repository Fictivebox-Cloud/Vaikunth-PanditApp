import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'city_screen.dart';
class Servies_you_screen extends StatefulWidget {
  const Servies_you_screen({Key? key}) : super(key: key);

  @override
  State<Servies_you_screen> createState() => _Servies_you_screenState();
}

class _Servies_you_screenState extends State<Servies_you_screen> {
  var ht,wt;
  Color kPrimaryColor = Color(0xffFF7D33);
  Color kSecondaryColor = Color(0xffCACACA);
  Color kScaffoldBackground = Color(0xffFFF3E9);
  Color p1Color =  Color(0xff6E798C);
  Color white = Color(0xffFFFFFF);
  Color h1Color =Color(0xff343D48);

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Container(

                          width: 48,
                          height: 2,
                          color: kPrimaryColor
                        ),
                        Container(

                          width: 48,
                          height: 2,
                            color: kPrimaryColor
                        ),
                        Container(

                          width: 48,
                          height: 2,
                            color: kPrimaryColor
                        ),
                        Container(

                          width: 48,
                          height: 2,
                          color: kSecondaryColor
                        ),
                        Container(

                          width: 48,
                          height: 2,
                            color: kSecondaryColor
                        ),
                        Container(

                          width: 48,
                          height: 2,
                            color: kSecondaryColor
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),


                       Text("Services you offer",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),

                    SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: (){
                        print("Container clicked");
                      },
                      child: Container(
                         width: wt*0.9,
                        height: ht* 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: kSecondaryColor)

                        ),
                        child: Center(child: Text("Puja"
                        , style: GoogleFonts.lato(fontWeight: FontWeight.w500,
                          fontSize: 16),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: (){
                        print("Container clicked");
                      },
                      child: Container(
                        width: wt*0.9,
                        height: ht* 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: kSecondaryColor)

                        ),
                        child: Center(child: Text("Astrology"
                          , style: GoogleFonts.lato(fontWeight: FontWeight.w500,
                              fontSize: 16),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: (){
                        print("Container clickedd");
                      },
                      child: Container(
                        width: wt*0.9,
                        height: ht* 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: kSecondaryColor)

                        ),
                        child: Center(child: Text("Funeral Services"
                          , style: GoogleFonts.lato(fontWeight: FontWeight.w500,
                              fontSize: 16),
                        )),
                      ),
                    )




                  ],
                ),
              ),
            ),
            Expanded(child: Center(
              child:
                 Padding(
                   padding: const EdgeInsets.only(left: 16,right: 16),
                   child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),

                      color: kPrimaryColor
                ),
                child: TextButton(

                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>City_Screen()));
                      }, child: Text('Next',style: GoogleFonts.lato(
                      color: Color(0xffFFFFFF),fontSize: 24,
                      fontWeight: FontWeight.w600),)),
              ),
                 ),
            ),)

          ],
        ),
      ),
    );
  }
}
