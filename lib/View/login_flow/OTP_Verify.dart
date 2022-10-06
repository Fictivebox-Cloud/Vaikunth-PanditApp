import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/View/Home/Home_Screen.dart';
import 'package:panditapp/View/login_flow/Name_Screen.dart';
import 'package:panditapp/view_model/Login/verification_number_api.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../Consts/text_const.dart';
import '../../Util/login_in_User.dart';
import '../../consts/themescolor.dart';

class OTPVerify extends StatefulWidget {
  String? mobile;

  OTPVerify({Key? key, this.mobile}) : super(key: key);

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  TextEditingController otpController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SmsAutoFill smsAutoFill = SmsAutoFill();
  String? strVerificationId;
  int strat =30;

  @override
  void initState() {
    phoneNumberVerification();
    startTimer();
  }

  Future<void> phoneNumberVerification() async {
    PhoneVerificationCompleted phoneVerificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await firebaseAuth.signInWithCredential(phoneAuthCredential);
      print(
          "Phone number is automatically verified and user signed in: ${firebaseAuth.currentUser!.uid}");
    };

    PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException authException) {
      print(
          'Phone number verification is failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    void Function(String verificationId, int? forceResendingToken)
        phoneCodeSent =
        (String verificationId, [int? forceResendingToken]) async {
      setState(() {
        strVerificationId = verificationId;
      });
    };

    PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
      setState(() {
        strVerificationId = verificationId;
      });
    };

    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: "+91${widget.mobile}",
          timeout: const Duration(seconds: 5),
          verificationCompleted: phoneVerificationCompleted,
          verificationFailed: phoneVerificationFailed,
          codeSent: phoneCodeSent,
          codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
    } catch (e) {
      print("Failed to Verify Phone Number: ${e}");
    }
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: strVerificationId!,
        smsCode: otpController.text,
      );

      final User? user =
          (await firebaseAuth.signInWithCredential(credential)).user;
      print("OTP Verify User ${user}");
      userRegistrationStatus();
    } catch (e) {
      print("Failed to sign in: " + e.toString());
    }
  }

  userRegistrationStatus() async {

    NumberVerifyViewModel numberVerifyViewModel = NumberVerifyViewModel();
    numberVerifyViewModel.NumberVerifyAPIcall(widget.mobile).then((value) {
      if (value) {
        LoggedInUserBloc.instance().setUserId(numberVerifyViewModel
            .numberverifyModel!.response!.panditDetails!.id
            .toString());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => NameScreen(
                      mobile: widget.mobile,
                    )),
            (route) => false);
      }
    });

  }

  void startTimer(){
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
    if(strat ==0 ){
     setState(() {
       timer.cancel();
     });
    }else{
      setState(() {
        strat --;
      });
    }
    });
  }

  var ht, wt;

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
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ENTER_OTP,
                      style: GoogleFonts.lato(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: h1Color),
                    ),
                    Text("mobile ${widget.mobile}"),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      ENTER_THE_6_DIGIT_CODE_RECEIVED_ON_YOUR_MOBILE,
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          color: p1Color,
                          fontSize: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          PinCodeTextField(
                            keyboardType: TextInputType.number,
                            controller: otpController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]")),
                            ],
                            // keyboardType: TextInputType.(),
                            appContext: context,
                            length: 6,
                            onChanged: (value) {
                              if (value.length == 6) {
                                print("object");
                                signInWithPhoneNumber();
                              }
                              ;
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 48,
                              fieldWidth: 48,
                              inactiveColor: const Color(0XFFCACACA),
                              activeColor: const Color(0XFFFF7D33),
                              selectedColor: const Color(0XFFFF7D33),
                            ),

                          ),
                          SizedBox(height: 20,)
                          ,RichText(text: TextSpan(
                            children: [
                              TextSpan(text: RESEND_OTP,style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w500,color: p1Color))
                              ,TextSpan(text: "00:$strat ",
                              style: GoogleFonts.lato(fontSize: 16,color: Colors.red)
                              ),
                        TextSpan(text: "sec",
                        style: GoogleFonts.lato(fontSize: 16,color: p1Color)
                    )
                            ]
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
