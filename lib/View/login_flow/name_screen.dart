import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Consts/text_const.dart';
import 'package:panditapp/View/login_flow/photo_upload.dart';
import 'package:provider/provider.dart';

import '../../consts/themescolor.dart';
import '../../view_model/Login/registeration_view_model.dart';

class NameScreen extends StatefulWidget {
  String? mobile;
  NameScreen({Key? key, this.mobile}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  var ht, wt;
  final _namecontroller = TextEditingController();

  @override
  void dispose() {
    _namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: body(),
    );
  }

  Widget button() {
    return Consumer<RegisterationViewModel>(
      builder: (context, provider, child) {
        return Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              elevation: MaterialStateProperty.resolveWith(
                  (states) => provider.isNotNull ? 5.0 : 0.0),
              padding: MaterialStateProperty.resolveWith((states) =>
                  EdgeInsets.symmetric(vertical: 13, horizontal: wt * 0.15)),
              shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                        side: BorderSide(
                          color: provider.isNotNull ? colorPrimary : divider,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      )),
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => provider.isNotNull ? colorPrimary : white),
            ),
            onPressed: () {
              provider.isNotNull
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhotoUpload(
                                name: _namecontroller.text,
                                mobile: widget.mobile,
                              )))
                  : null;
            },
            child: Text(
              NEXT,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: provider.isNotNull ? white : dividerr,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget textField() {
    return Consumer<RegisterationViewModel>(
      builder: (context, provider, child) {
        return TextField(
          cursorColor: colorPrimary,
          controller: _namecontroller,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: h1Color,
          ),
          onChanged: (value) {
            provider.setIsNotNull(data: value.isNotEmpty);
          },
          decoration: const InputDecoration(
            filled: true,
            fillColor: TEXTFIELD_BACKGROUND_COLOR,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
            ),
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
            ),
          ),
          inputFormatters: [
            //LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
          ],
        );
      },
    );
  }

  Widget stepContainer({Color? color}) {
    return Container(
      width: wt * 0.12,
      height: 4,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
    );
  }

  Widget body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stepContainer(
                      color: kPrimaryColor,
                    ),
                    stepContainer(
                      color: kSecondaryColor,
                    ),
                    stepContainer(
                      color: kSecondaryColor,
                    ),
                    stepContainer(
                      color: kSecondaryColor,
                    ),
                    stepContainer(
                      color: kSecondaryColor,
                    ),
                    stepContainer(
                      color: kSecondaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  FILL_YOUR_PROFILE_DETAILS,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  ENTER_YOUR_NAME,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: p1Color),
                ),
                const SizedBox(
                  height: 10,
                ),
                textField(),
              ],
            ),
            button(),
          ],
        ),
      ),
    );
  }
}
