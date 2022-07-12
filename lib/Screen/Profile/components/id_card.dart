import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Id_card_Screen extends StatefulWidget {
  const Id_card_Screen({Key? key}) : super(key: key);

  @override
  State<Id_card_Screen> createState() => _Id_card_ScreenState();
}

class _Id_card_ScreenState extends State<Id_card_Screen> {
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

    return Scaffold(
      backgroundColor: white ,

      appBar: AppBar(
        title: Center(child: Text("ID Card")),



      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 195,
                decoration: BoxDecoration(
                  color: white,

                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      width: 1,
                      color: kSecondaryColor

                  ),


                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(

                            radius: 40.0,
                            child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwihVNuLOzSu0timFcUZ0z1t23FrAEJ2EPghv3aKtvitpJlZ1wBmUPwXmb2GEDgSdnqeA&usqp=CAU"),
                          ),
                          Text("Vaikunth",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 32,color: h1Color),)
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Arvind Singh",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w500,color: p1Color),),
                              Text("+91 8218772191",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: h1Color))
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset("assets/images/right.png"),
                              Text("Approved")
                            ],
                          )
                        ],

                      )
                    ],
                  ),
                ) ,
              ),
              SizedBox(height: 18,),
              Text("Other Documents", style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 20),)
              ,SizedBox(height: 12,),
              Text("Adhar",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600,color: p1Color),),
              SizedBox(height: 4,),
              Container(
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  color: white,

                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      width: 1,
                      color: kSecondaryColor

                  ),


                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Arvindadhar.pdf",style: GoogleFonts.lato(
                          fontSize: 16,fontWeight: FontWeight.w500,
                          color: kSecondaryColor),),
                      Container(
                        width: 116,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: kPrimaryColor
                        ),
                        child: Center(child: Text("View")),
                      )
                    ],
                  ),
                  
                ),
                
              ),
              SizedBox(height: 8,),
              Text("PAN",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 16,color: p1Color),)
              ,SizedBox(
                height: 8,
              )
              ,Container(
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  color: white,

                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      width: 1,
                      color: kSecondaryColor

                  ),


                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Arvindadhar.pdf",style: GoogleFonts.lato(
                          fontSize: 16,fontWeight: FontWeight.w500,
                          color: kSecondaryColor),),
                      Container(
                        width: 116,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: kPrimaryColor
                        ),
                        child: Center(child: Text("View")),
                      )
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
