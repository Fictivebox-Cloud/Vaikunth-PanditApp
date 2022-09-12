import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/View/Home/Home_Screen.dart';
import 'package:panditapp/View/login_flow/Name_Screen.dart';
import 'package:panditapp/view_model/verification_number_api.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../Consts/color1.dart';

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

  @override
  void initState() {
    phoneNumberVerification();
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    NumberVerifyViewModel numberVerifyViewModel = NumberVerifyViewModel();
    numberVerifyViewModel.NumberVerifyAPIcall(widget.mobile).then((value) {
      if (value) {
        prefs.setString("name",
            "${numberVerifyViewModel.numberverifyModel!.response!.panditDetails!.panditFirstName.toString()} ${numberVerifyViewModel.numberverifyModel!.response!.panditDetails!.panditLastName.toString()} ");
        prefs.setString("pandit_id", numberVerifyViewModel.numberverifyModel!.response!.panditDetails!.id.toString());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home_Screen()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Name_Screen(
                      mobile: widget.mobile,
                    )),
            (route) => false);
      }
    });
    // Consumer
    //    <NumberVerifyViewModel>(builder: (_, data, __) {
    //   if(data.loading == false && data.userError == null) {
    //     print("Data Data");
    //     data.numberverifyModel!.response?.panditDetails != null ?
    //        :
    //
    //     ;
    //   }
    //   return Container();
    // });
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
                      'Enter OTP',
                      style: GoogleFonts.lato(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: h1Color),
                    ),
                    Text("mobile ${widget.mobile}"),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Enter the 6 digit code received on your mobile.',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          color: p1Color,
                          fontSize: 14),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
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
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      // padding: const EdgeInsets.all(16.0),
                      primary: p1Color,
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
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
