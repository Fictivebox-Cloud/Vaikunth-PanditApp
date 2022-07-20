import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Screen/login_flow/Name_Screen.dart';
class OTP_verify extends StatefulWidget {
  const OTP_verify({Key? key}) : super(key: key);

  @override
  State<OTP_verify> createState() => _OTP_verifyState();
}

class _OTP_verifyState extends State<OTP_verify> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Text('Enter OTP',style: GoogleFonts.lato(fontSize: 24,
                        fontWeight: FontWeight.w500
                            ,color: h1Color
                        ),),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Enter the 4 digit code received on your mobile.',style:
                          GoogleFonts.lato(fontWeight: FontWeight.w400,
                          color: p1Color,
                            fontSize: 14
                          ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 2,right:2 ,top: 30),
                      child: Form(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black
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
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(fillColor: Color(0xffCACACA)),
                            ),),
                          ),

                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black
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
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(fillColor: Color(0xffCACACA)),
                              ),),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black
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
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(fillColor: Color(0xffCACACA)),
                              ),),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black
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
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(fillColor: Color(0xffCACACA)),
                              ),),
                          )
                        ],
                      )),
                    ),



                  ],
                ),
              ),
            ),
            Column(
              children: [
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,bottom: 24),
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),

                    color: kPrimaryColor
                ),
                child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Name_Screen()));
                    }, child: Text('Verify',style:
                GoogleFonts.lato(
                    color: white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600

                ),
                )),
              ),
            ),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 24),
          child: TextButton(
            style: TextButton.styleFrom(
              // padding: const EdgeInsets.all(16.0),
              primary: p1Color,
              textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
            ),
            onPressed: () {},
            child: const Text('Resend OTP'),
          ),
        )],
            )
          ],
        ),
      ),
    );
  }
  
}
