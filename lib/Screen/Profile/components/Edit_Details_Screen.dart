import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Edit_Details_Screen extends StatefulWidget {
  const Edit_Details_Screen({Key? key}) : super(key: key);

  @override
  State<Edit_Details_Screen> createState() => _Edit_Details_ScreenState();
}

class _Edit_Details_ScreenState extends State<Edit_Details_Screen> {

  Color kPrimaryColor = const Color(0xffFF7D33);
  Color kSecondaryColor = const Color(0xffCACACA);
  Color kScaffoldBackground = const Color(0xffFFF3E9);
  Color p1Color = const Color(0xff6E798C);
  Color white = const Color(0xffFFFFFF);
  Color h1Color = const Color(0xff343D48);
  Color buttonColor = const Color(0xff109D03);
  Color b1Color =const Color(0xff6363BE);
  var ht,wt;

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,

      appBar: AppBar(
        title: Text("Edit Details"),
      ),
      body: SafeArea(
        child: Column(
          children: [
              SingleChildScrollView(

                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",style: GoogleFonts.lato(
                          fontSize: 18,fontWeight: FontWeight.w500,color: h1Color),),
                      SizedBox(height: 12,),
                      Container(
                        width: double.infinity,
                        height: 48,
                         decoration: BoxDecoration(

                           borderRadius: BorderRadius.circular(4),
                           border: Border.all(
                               width: 1,
                               color: kSecondaryColor

                           ),
                         ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Vikrant bhawani",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 16,color: kSecondaryColor),),
                        ),
                      ),
                      SizedBox(height: 32,),
                      Text("Services offered",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w500),)
                        ,SizedBox(height: 9.0,),
                      Row(
                        children: [
                             Image.asset("assets/images/chopada_pujan_book.png")
                            ,SizedBox(width: 23,) ,Text("Puja", style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 14,color: kPrimaryColor),)

                        ],
                      ),
                        SizedBox(height: 14,),
                      Row(
                        children: [
                          Image.asset("assets/images/cemetery.png")
                          ,SizedBox(width: 23,) ,Text("Funeral Services", style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 14,color: kPrimaryColor),)


                        ],
                      ),
                      SizedBox(height: 12,),
                      DottedBorder(
                         borderType: BorderType.RRect,
                          strokeWidth: 2,
                          dashPattern: [6,3,2,3],
                          color: kPrimaryColor,
                          radius: Radius.circular(4),
                          child: ClipRRect(

                            child: InkWell(
                              onTap: (){
                                showModalBottomSheet(
                                  context: context,
                                  builder: (builder)=> bottomSheet(),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 46,
                                child: Center(child: Text("Add/Remove services",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w500,color: kPrimaryColor),)),
                              ),
                            ),
                          )

                      ),
                      SizedBox(height: 44,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("City",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18,),),
                          Text("EDIT",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w500,color: kPrimaryColor),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              width: 1,
                              color: kSecondaryColor

                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Noida",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 16,color: kSecondaryColor),),
                        ),
                      ),

                    ],
                  ),
                ),

              )
          ],
        ),
      )
    );
  }
  Widget bottomSheet(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      margin:  EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text("Services offered",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 16,color: kSecondaryColor),),
          SizedBox(
            height: 12,
          ),
          Text("Add/Remove services you offered.",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: h1Color),)
      ,SizedBox(
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
          ),
          SizedBox(
            height: 40,
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
                  color: kPrimaryColor

              ),
              child: Center(child: Text("Save"
                , style: GoogleFonts.lato(fontWeight: FontWeight.w500,
                    fontSize: 16,color: white),
              )),
            ),
          )

        ],
      ),


    );
  }
}
