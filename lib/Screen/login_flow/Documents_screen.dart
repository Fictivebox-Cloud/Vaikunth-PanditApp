import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Screen/login_flow/Account_details.dart';
class Documents_Screen extends StatefulWidget {
  const Documents_Screen({Key? key}) : super(key: key);

  @override
  State<Documents_Screen> createState() => _Documents_ScreenState();
}

class _Documents_ScreenState extends State<Documents_Screen> {
  var ht,wt;

  Color kPrimaryColor = Color(0xffFF7D33);
  Color kSecondaryColor = Color(0xffCACACA);
  Color kScaffoldBackground = Color(0xffFFF3E9);
  Color p1Color =  Color(0xff6E798C);
  Color white = Color(0xffFFFFFF);
  Color h1Color =Color(0xff343D48);
  TextEditingController _addharno = TextEditingController();
  TextEditingController _panno = TextEditingController();

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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
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
                            color: Color(0xffFF7D33),
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
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),


                      Text("Documents",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),

                      SizedBox(
                        height: 17,
                      ),
                      Text("Aadhar",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18),),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Image.asset("assets/images/Aadhar Front.png"),
                          Image.asset("assets/images/Aadhar Back.png")


                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                width: 1,
                                color: Colors.black
                            )
                        ),
                        child: Center(
                          child: TextFormField(
                            keyboardType: TextInputType.number,


                            decoration: InputDecoration(

                                border: InputBorder.none,

                                hintText: "Enter Your Aadhar No",
                                hintStyle: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: kSecondaryColor),

                                )

                            ),
                        ),
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text("PAN",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18),),
                      SizedBox(
                        height: 16,
                      ),
                      Row(

                        children: [
                          Image.asset("assets/images/PAN.png")


                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                width: 1,
                                color: Colors.black
                            )
                        ),
                        child: Center(
                          child: TextFormField(
                              keyboardType: TextInputType.number,


                              decoration: InputDecoration(

                                border: InputBorder.none,

                                hintText: "Enter Your PAN No",
                                hintStyle: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: kSecondaryColor),

                              )

                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:16,right:16,bottom: 24),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),

                      color: kPrimaryColor
                  ),
                  child: TextButton(

                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Account_details()));
                      }, child: Text('Next',style: GoogleFonts.lato(
                      color: white,fontSize: 24,
                      fontWeight: FontWeight.w600),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
