import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Consts/text_const.dart';
import 'package:panditapp/View/login_flow/otp_verify.dart';
import 'package:panditapp/consts/image_const.dart';
import '../../consts/themescolor.dart';
import '../../view_model/home_tab/booking_request_view_model.dart';

class PhoneNumber_Screen extends StatefulWidget {
  const PhoneNumber_Screen({Key? key}) : super(key: key);

  @override
  State<PhoneNumber_Screen> createState() => _PhoneNumber_ScreenState();
}


class _PhoneNumber_ScreenState extends State<PhoneNumber_Screen> {
  var phoneController = TextEditingController();
  BookingRequestViewModel? booking_request_view_model;

  var ht, wt;

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: colorPrimary,
    ));
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start  ,
                children: [
                  Text(
                    ENTER_YOUR_PHONE_NUMBER,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, color: h1Color, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textFiled(),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              button(),
            ],
          ),
        ),
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
        onPressed: () {
          if (phoneController.text.length == 10) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OTP_verify(
                          mobile: phoneController.text,
                        )));
          } else {
            Fluttertoast.showToast(msg: NUMBER_VALIDATION);
          }
        },
        child: Text(
          SEND_OTP,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: white,
          ),
        ),
      ),
    );
  }

  Widget textFiled() {
    return Container(
        height: 48,
        decoration: BoxDecoration(
            color: TEXTFIELD_BACKGROUND_COLOR,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 2, color: TEXTFIELD_BORDER_COLOR)),
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(ImageConst().FLAG_IMAGES)),
            const SizedBox(
              width: 10,
            ),
            Text(
              "+91",
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              width: 5,
            ),
            const VerticalDivider(
              width: 2,
              color: kSecondaryColor,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 10),
                child: TextFormField(
                  cursorColor: kPrimaryColor,
                  controller: phoneController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
