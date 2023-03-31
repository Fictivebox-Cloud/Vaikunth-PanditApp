import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/material/bottom_sheet.dart';
import 'package:panditapp/consts/text_const.dart';

import 'package:panditapp/View/login_flow/account_detail.dart';

import 'package:image_picker/image_picker.dart';
import 'package:panditapp/consts/image_const.dart';

import 'package:panditapp/model/getterSetter.dart';
import 'package:panditapp/view_model/Login/registeration_view_model.dart';
import 'package:provider/provider.dart';

import '../../consts/themescolor.dart';

class DocumentScreen extends StatefulWidget {
  final String? name, mobile, servicesname, cityId;
  final File? profilePic;

  const DocumentScreen(
      {Key? key,
      this.name,
      this.profilePic,
      this.mobile,
      this.servicesname,
      this.cityId})
      : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class _DocumentScreenState extends State<DocumentScreen> {
  var ht, wt;
  File? adharBackPic;
  File? adharFrontPic;
  File? panCardPic;

  TextEditingController _adharNumber = TextEditingController();
  TextEditingController _panCardNumber = TextEditingController();

  Widget stepContainer({Color? color}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.12,
      height: 4,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
    );
  }

  Widget adharPic() {
    return SizedBox(
      width: wt * 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: wt * 0.44,
            height: 120,
            child: InkWell(
              onTap: () {
                imagePickerOption(type: "adharFront");
              },
              child: adharFrontPic != null
                  ? Image.file(
                      adharFrontPic!,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      ImageConst().AADHARFRONT,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          SizedBox(
            width: wt * 0.44,
            height: 120,
            child: InkWell(
              onTap: () {
                imagePickerOption(type: "adharBack");
              },
              child: adharBackPic != null
                  ? Image.file(
                      adharBackPic!,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      ImageConst().AADHARBACK,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                          color: kPrimaryColor,
                        ),
                        stepContainer(
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      FILL_YOUR_PROFILE_DETAILS,
                      style: GoogleFonts.poppins(
                          color: h1Color,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      CLICK_ADHAR_CARD_PICTURE,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: p1Color),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    adharPic(),
                    const SizedBox(
                      height: 16,
                    ),
                    adharTextField(),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      CLICK_PAN_CARD_PICTURE,
                      style: GoogleFonts.poppins(
                          color: p1Color,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    panCardPhoto(),
                    const SizedBox(
                      height: 22,
                    ),
                    panCardTextField(),
                  ],
                ),
              ),
            ),
            button(),
          ],
        ),
      ),
    );
  }

  Widget panCardPhoto() {
    return SizedBox(
      width: wt * 0.45,
      height: 120,
      child: InkWell(
        onTap: () {
          imagePickerOption(type: "panCard");
        },
        child: panCardPic != null
            ? Image.file(
                panCardPic ?? File(""),
                //width: 170,
                //height: 170,
                fit: BoxFit.fill,
              )
            : Image.asset(
                ImageConst().PAN,
                fit: BoxFit.fill,
              ),
      ),
    );
  }

  Widget adharTextField() {
    return TextField(
      cursorColor: colorPrimary,
      controller: _adharNumber,
      onChanged: (value) {},
      keyboardType: TextInputType.number,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w400, fontSize: 16, color: p1Color),
      decoration: InputDecoration(
        filled: true,
        fillColor: TEXTFIELD_BACKGROUND_COLOR,
        hintText: ADHAR,
        hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400, fontSize: 16, color: p1Color),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(12),
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
    );
  }

  Widget panCardTextField() {
    return TextField(
      cursorColor: colorPrimary,
      controller: _panCardNumber,
      onChanged: (value) {},
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w400, fontSize: 16, color: p1Color),
      decoration: InputDecoration(
        filled: true,
        fillColor: TEXTFIELD_BACKGROUND_COLOR,
        hintText: PANCARD,
        hintStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w400, fontSize: 16, color: p1Color),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      inputFormatters: [
        //LengthLimitingTextInputFormatter(10),
        UpperCaseTextFormatter(),
        FilteringTextInputFormatter.allow(RegExp("[A-Z a-z 0-9]")),
      ],
    );
  }

  void imagePickerOption({String? type}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: ht * 0.25,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: ht * 0.01,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: wt * 0.30,
                        height: ht * 0.20,
                        decoration: const BoxDecoration(
                            color: Color(0xffECF1F6),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xffECF1F6),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(4, 4))
                            ]),
                        child: InkWell(
                          onTap: () {
                            pickImage(ImageSource.camera, type);
                          },
                          child: const Icon(
                            Icons.camera,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      Container(
                        width: wt * 0.30,
                        height: ht * 0.20,
                        decoration: const BoxDecoration(
                            color: Color(0xffECF1F6),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xffECF1F6),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(4, 4))
                            ]),
                        child: InkWell(
                            onTap: () {
                              pickImage(ImageSource.gallery, type);
                            },
                            child: const Icon(
                              Icons.folder_open,
                              color: kPrimaryColor,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        OPENCAMERA,
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        OPENFILE,
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType, String? type) async {
    try {
      final photo =
          await ImagePicker().pickImage(source: imageType, imageQuality: 20);
      if (photo == null) return;
      type == "adharFront"
          ? adharFrontPic = File(photo.path)
          : type == "adharBack"
              ? adharBackPic = (File(photo.path))
              : panCardPic = (File(photo.path));
      Navigator.pop(context);
      setState(() {});
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            alignment: Alignment.center,
            elevation: MaterialStateProperty.resolveWith((states) => 0.0),
            padding: MaterialStateProperty.resolveWith((states) =>
                EdgeInsets.symmetric(vertical: 13, horizontal: wt * 0.15)),
            shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                      side: const BorderSide(
                        color: divider,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    )),
            backgroundColor: MaterialStateColor.resolveWith((states) => white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            BACK,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: dividerr,
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            alignment: Alignment.center,
            elevation: MaterialStateProperty.resolveWith((states) =>
                _adharNumber.text.isNotEmpty &&
                        _panCardNumber.text.isNotEmpty &&
                        adharFrontPic != null &&
                        adharBackPic != null &&
                        panCardPic != null
                    ? 5.0
                    : 0.0),
            padding: MaterialStateProperty.resolveWith((states) =>
                EdgeInsets.symmetric(vertical: 13, horizontal: wt * 0.15)),
            shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                      side: BorderSide(
                        color: _adharNumber.text.isNotEmpty &&
                                _panCardNumber.text.isNotEmpty &&
                                adharFrontPic != null &&
                                adharBackPic != null &&
                                panCardPic != null
                            ? colorPrimary
                            : divider,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    )),
            backgroundColor: MaterialStateColor.resolveWith((states) =>
                _adharNumber.text.isNotEmpty &&
                        _panCardNumber.text.isNotEmpty &&
                        adharFrontPic != null &&
                        adharBackPic != null &&
                        panCardPic != null
                    ? colorPrimary
                    : white),
          ),
          onPressed: () {
            _adharNumber.text.isNotEmpty &&
                    _panCardNumber.text.isNotEmpty &&
                    adharFrontPic != null &&
                    adharBackPic != null &&
                    panCardPic != null
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountDetail(
                        aadhar: _adharNumber.text,
                        pancard: _panCardNumber.text,
                        name: widget.name,
                        photo: widget.profilePic,
                        mobile: widget.mobile,
                        photoaadharback: adharBackPic,
                        photoaadharfront: adharFrontPic,
                        pan: panCardPic,
                        cityId: widget.cityId,
                        servicesname: widget.servicesname,
                      ),
                    ),
                  )
                : null;
          },
          child: Text(
            NEXT,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _adharNumber.text.isNotEmpty &&
                      _panCardNumber.text.isNotEmpty &&
                      adharFrontPic != null &&
                      adharBackPic != null &&
                      panCardPic != null
                  ? white
                  : dividerr,
            ),
          ),
        ),
      ],
    );
  }
}
