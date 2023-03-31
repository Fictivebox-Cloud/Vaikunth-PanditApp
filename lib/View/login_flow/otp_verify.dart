import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/View/Home/Home_Screen.dart';
import 'package:panditapp/View/login_flow/name_screen.dart';
import 'package:panditapp/model/Login%20Model/number_verify_model.dart';
import 'package:panditapp/view_model/Login/verification_number_api.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../Consts/text_const.dart';
import '../../Util/login_in_User.dart';
import '../../consts/themescolor.dart';

class OTP_verify extends StatefulWidget {
  String? mobile;

  OTP_verify({Key? key, this.mobile}) : super(key: key);

  @override
  State<OTP_verify> createState() => _OTP_verifyState();
}

class _OTP_verifyState extends State<OTP_verify> {
  TextEditingController otpController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SmsAutoFill smsAutoFill = SmsAutoFill();
  String? strVerificationId;
  int start = 30;

  @override
  void initState() {
    //phoneNumberVerification();
    startTimer();
  }

  Future<void> phoneNumberVerification() async {
    phoneVerificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
      await firebaseAuth.signInWithCredential(phoneAuthCredential);
    }

    phoneVerificationFailed(FirebaseAuthException authException) {}

    phoneCodeSent(String verificationId, [int? forceResendingToken]) async {
      setState(() {
        strVerificationId = verificationId;
      });
    }

    phoneCodeAutoRetrievalTimeout(String verificationId) {
      setState(() {
        strVerificationId = verificationId;
      });
    }

    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: "+91${widget.mobile}",
          timeout: const Duration(seconds: 5),
          verificationCompleted: phoneVerificationCompleted,
          verificationFailed: phoneVerificationFailed,
          codeSent: phoneCodeSent,
          codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
    } catch (e) {
      Fluttertoast.showToast(msg: REACHED_OTP_LIMIT);
      log("Error $e");
    }
  }

  void signInWithPhoneNumber() async {
    try {
      // final AuthCredential credential = PhoneAuthProvider.credential(
      //   verificationId: strVerificationId!,
      //   smsCode: otpController.text,
      // );

      // final User? user =
      //     (await firebaseAuth.signInWithCredential(credential)).user;
      // userRegistartionStatus();
    } catch (e) {
      Fluttertoast.showToast(msg: WRONG_OTP);
      log("Error $e");
    }
  }

  userRegistartionStatus(String? otp, String? resendFlag) async {
    NumberVerifyViewModel numberVerifyViewModel = NumberVerifyViewModel();
    await numberVerifyViewModel.NumberVerifyAPIcall(
            widget.mobile, otp, resendFlag)
        .then((value) {
      if (value != null &&
          numberVerifyViewModel.numberverifyModel!.response != null) {
        LoggedInUserBloc.instance().setUserId(numberVerifyViewModel
            .numberverifyModel!.response!.panditDetails!.id
            .toString());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      } else {
        if (value != null &&
            numberVerifyViewModel.numberverifyModel!.response == null) {
          Fluttertoast.showToast(
              msg: numberVerifyViewModel.numberverifyModel!.message ??
                  WRONG_OTP);
          //.showToast(msg: WRONG_OTP);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => NameScreen(
                        mobile: widget.mobile,
                      )),
              (route) => false);
        }
      }
    });
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  void dispose() {
    start = 0;
    super.dispose();
  }

  var ht, wt;

  Widget otpField() {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      controller: otpController,
      inputFormatters: [
        LengthLimitingTextInputFormatter(4),
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
      // keyboardType: TextInputType.(),
      appContext: context,
      length: 4,
      onChanged: (value) {
        if (value.length == 4) {
          //signInWithPhoneNumber();
        }
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 48,
        fieldWidth: 48,
        inactiveColor: kSecondaryColor,
        activeColor: kPrimaryColor,
        selectedColor: kPrimaryColor,
      ),
    );
  }

  Widget button() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          padding: MaterialStateProperty.resolveWith(
              (states) => const EdgeInsets.symmetric(
                    vertical: 13,
                  )),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => colorPrimary),
        ),
        onPressed: () async {
          //signInWithPhoneNumber();
          await userRegistartionStatus(otpController.text.toString(), "");
        },
        child: Text(
          CONFIRM,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: white,
          ),
        ),
      ),
    );
  }

  Widget otpVerify() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          OTP_AUTHENTICATION,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: h1Color,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: AUTHENTICATION_CODE,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: p1Color,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: widget.mobile,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: p1Color,
              fontSize: 12,
            ),
          ),
        ])),
        const SizedBox(
          height: 40,
        ),
        otpField(),
        const SizedBox(
          height: 20,
        ),
        button(),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  if (start == 0) {
                    //phoneNumberVerification();
                    userRegistartionStatus("", "1");
                    startTimer();
                    start = 30;
                    setState(() {});
                  }
                },
                child: Text(RESEND_OTP,
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: p1Color))),
            start == 0
                ? Container()
                : Text("00:${start >= 10 ? "" : "0"}$start ",
                    style: GoogleFonts.lato(fontSize: 16, color: Colors.red)),
            start == 0
                ? Container()
                : Text("sec",
                    style: GoogleFonts.lato(fontSize: 16, color: p1Color)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: otpVerify(),
        ),
      ),
    );
  }
}
