import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Phone_Auth/auth_cubit.dart';
import 'package:panditapp/Phone_Auth/auth_state.dart';
import 'package:panditapp/Services/verification_number_api.dart';
import 'package:panditapp/Viwe/Home/Home_Screen.dart';

import 'package:panditapp/Viwe/login_flow/Name_Screen.dart';

import 'package:pin_code_fields/pin_code_fields.dart';


class OTP_verify extends StatefulWidget {
  String? mobile;

  OTP_verify({Key? key,this.mobile}) : super(key: key);

  @override
  State<OTP_verify> createState() => _OTP_verifyState();
}

class _OTP_verifyState extends State<OTP_verify> {

  TextEditingController otpController = TextEditingController();

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
                padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Text('Enter OTP',style: GoogleFonts.lato(fontSize: 24,
                        fontWeight: FontWeight.w500
                            ,color: h1Color
                        ),),

                       // Text("mobile ${widget.mobile}"),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Enter the 6 digit code received on your mobile.',style:
                          GoogleFonts.lato(fontWeight: FontWeight.w400,
                          color: p1Color,
                            fontSize: 14
                          ),),

                    Padding(padding: EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          // TextField(
                          //   controller: otpController,
                          //   maxLines: 6,
                          //   decoration: InputDecoration(
                          //     border: OutlineInputBorder(
                          //     ),
                          //     hintText: "6-digit OTP"
                          //
                          //   ),
                          // ),


                          PinCodeTextField(
                            keyboardType: TextInputType.number,
                            controller: otpController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                          ],
                           // keyboardType: TextInputType.(),
                              appContext: context,
                              length: 6,
                              onChanged: (value){
                                print(value);
                              },
                            pinTheme: PinTheme(

                              shape: PinCodeFieldShape.box,

                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 48,
                              fieldWidth: 48,

                              inactiveColor: Color(0XFFCACACA),
                              activeColor: Color(0XFFFF7D33),
                              selectedColor: Color(0XFFFF7D33),

                            ),
                          ),




                        ],

                      ),
                    )





                  ],
                ),
              ),
            ),




            Column(
              children: [

            BlocConsumer<AuthCubit, AuthState>(
              listener: (context,state){
                if(state is AuthLoggedInState){
                  Navigator.popUntil(context,(route) => route.isFirst);

                  Navigator.pushReplacement(context, CupertinoPageRoute(
                      builder: (context)=>
                          Name_Screen(mobile: widget.mobile,)
                  ));

                }
                else if(state is AuthErrorState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                        content: Text(state.error),
                      duration: Duration(milliseconds: 600),
                    )
                    // context: Text(state.error),
                  );
                }


            },
              builder: (context, state) {
                if(state is AuthLoadingState){
                  return
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Center(
                      child: CircularProgressIndicator(color: Color(0xFFFF7D33),),
                  ),
                    );
                }

                return Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 24),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                        color: kPrimaryColor
                    ),
                    child: TextButton(
                        onPressed: () {

                          BlocProvider.of<AuthCubit>(context).verifyOTP(otpController.text);
                          // Navigator.push(context, MaterialPageRoute(
                          //     builder: (context) => Name_Screen()));
                        }, child: Text('Verify', style:
                    GoogleFonts.lato(
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600

                    ),
                    )),
                  ),
                );
              }
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
        ),


              ],
            )
          ],
        ),
      ),
    );
  }
  
}
