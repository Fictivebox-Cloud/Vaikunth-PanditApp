import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Screen/login_flow/Documents_screen.dart';
class City_Screen extends StatefulWidget {
  const City_Screen({Key? key}) : super(key: key);

  @override
  State<City_Screen> createState() => _City_ScreenState();
}

class _City_ScreenState extends State<City_Screen> {
  var ht,wt;

  Color kPrimaryColor = Color(0xffFF7D33);
  Color kSecondaryColor = Color(0xffCACACA);
  Color kScaffoldBackground = Color(0xffFFF3E9);
  Color p1Color =  Color(0xff6E798C);
  Color white = Color(0xffFFFFFF);
  Color h1Color =Color(0xff343D48);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30,top: 10),
                child: SingleChildScrollView(
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
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),


                      Text("Select your city",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),

                      SizedBox(
                        height: 32,
                      ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            width: 1,
                            color: Colors.black
                        )
                    ),
                    child: TextFormField(


                      decoration: InputDecoration(

                          border: InputBorder.none,

                          hintText: "Search for your city",
                          hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: kSecondaryColor),

                          prefixIcon: const Icon(Icons.search,color: Color(0xff6E798C),

                          )

                      ),
                    ),
                  )





                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: Center(
              child: Padding(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Documents_Screen()));
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
