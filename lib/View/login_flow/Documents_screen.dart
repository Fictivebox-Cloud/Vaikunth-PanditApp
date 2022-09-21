import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Consts/text_const.dart';

import 'package:panditapp/View/login_flow/Account_details.dart';

import 'package:image_picker/image_picker.dart';
import 'package:panditapp/consts/image_const.dart';

import 'package:panditapp/model/getterSetter.dart';

import '../../Consts/color1.dart';

class Documents_Screen extends StatefulWidget {
  final String? name4, mobile, servicesname;
  final File? photo4;

  const Documents_Screen(
      {Key? key, this.name4, this.photo4, this.mobile, this.servicesname})
      : super(key: key);

  @override
  State<Documents_Screen> createState() => _Documents_ScreenState();
}

class _Documents_ScreenState extends State<Documents_Screen> {
  var ht, wt;
  File? pickedImage0;
  File? pickedImage1;
  File? pickedImage2;

  TextEditingController _addharno = TextEditingController();
  TextEditingController _panno = TextEditingController();

  pickImage0(ImageSource imageType) async {
    try {
      final photo =
          await ImagePicker().pickImage(source: imageType, imageQuality: 20);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage0 = tempImage;
      });

      Get.back();
    } catch (error) {
      //debugPrint(error.toString());
    }
  }

  pickImage1(ImageSource imageType) async {
    try {
      final photo1 =
          await ImagePicker().pickImage(source: imageType, imageQuality: 20);
      if (photo1 == null) return;
      final tempImages = File(photo1.path);
      setState(() {
        pickedImage1 = tempImages;
      });

      Get.back();
    } catch (error) {
      // debugPrint(error.toString());
    }
  }

  pickImage2(ImageSource imageType) async {
    try {
      final photo2 =
          await ImagePicker().pickImage(source: imageType, imageQuality: 20);
      if (photo2 == null) return;
      final tempImages = File(photo2.path);
      setState(() {
        pickedImage2 = tempImages;
      });

      Get.back();
    } catch (error) {
      //debugPrint(error.toString());
    }
  }

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
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(width: 48, height: 2, color: kPrimaryColor),
                          Container(width: 48, height: 2, color: kPrimaryColor),
                          Container(width: 48, height: 2, color: kPrimaryColor),
                          Container(
                            width: 48,
                            height: 2,
                            color: kPrimaryColor,
                          ),
                          Container(width: 48, height: 2, color: kPrimaryColor),
                          Container(
                              width: 48, height: 2, color: kSecondaryColor),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        DOCUMENT,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500, fontSize: 24),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Text(
                        AADHAR,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: wt * 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: wt * 0.45,
                              height: 111,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheet(),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  child: pickedImage1 != null
                                      ? Image.file(
                                          pickedImage1!,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          ImageConst().AADHARFRONT,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: wt * 0.45,
                              height: 111,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (builder) => bottomSheetback(),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  child: pickedImage0 != null
                                      ? Image.file(
                                          pickedImage0!,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          ImageConst().AADHARBACK,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 48,
                        child: TextField(
                          cursorColor: colorPrimary,
                          controller: _addharno,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              //prefixIcon: const Icon(Icons.search,color: p1Color,),
                              fillColor: grey,
                              hintText: ENTER_YOUR_AADHAR_NO,
                              hintStyle: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: kSecondaryColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: colorPrimary, width: 2.0),
                                // borderRadius: BorderRadius.circular(25.0),
                              ),
                              border: OutlineInputBorder()),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(12),
                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        PAN,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: wt * 0.45,
                        height: 111,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (builder) => bottomSheetpan(),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: pickedImage2 != null
                                ? Image.file(
                                    pickedImage2!,
                                    //width: 170,
                                    //height: 170,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    ImageConst().PAN,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 48,
                        child: TextField(
                          cursorColor: colorPrimary,
                          controller: _panno,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              //prefixIcon: const Icon(Icons.search,color: p1Color,),
                              fillColor: grey,
                              hintText: ENTER_YOUR_PAN_NO,
                              hintStyle: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: kSecondaryColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: colorPrimary, width: 2.0),
                                // borderRadius: BorderRadius.circular(25.0),
                              ),
                              border: OutlineInputBorder(

                                  //borderRadius: BorderRadius.circular(24)
                                  )),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z0-9]")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: kPrimaryColor),
                  child: TextButton(
                      onPressed: () {
                        GetterloginSetter s = GetterloginSetter();
                        s.pancard = _addharno.text;
                        s.aadhar = _panno.text;
                        s.Photo = pickedImage0;

                        print("Bhawani addhar ${s.pancard}");
                        print("Bhawani pan ${s.aadhar}");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Account_details(
                                    aadhar: _addharno.text,
                                    pancard: _panno.text,
                                    name5: widget.name4,
                                    photo5: widget.photo4,
                                    mobile: widget.mobile,
                                    photoaadharback: pickedImage0,
                                    photoaadharfront: pickedImage1,
                                    pan: pickedImage2,
                                    servicesname: widget.servicesname)));
                      },
                      child: Text(
                        NEXT,
                        style: GoogleFonts.lato(
                            color: white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //aadhar front
  Widget bottomSheet() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: wt * 0.30,
                height: ht * 0.20,
                decoration: BoxDecoration(
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
                    pickImage1(ImageSource.camera);
                  },
                  child: Icon(
                    Icons.camera,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Container(
                width: wt * 0.30,
                height: ht * 0.20,
                decoration: BoxDecoration(
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
                      pickImage1(ImageSource.gallery);
                    },
                    child: Icon(
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
                style:
                    GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                OPENFILE,
                style:
                    GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }

  //aadhar back
  Widget bottomSheetback() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: wt * 0.30,
                height: ht * 0.20,
                decoration: BoxDecoration(
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
                    pickImage0(ImageSource.camera);
                  },
                  child: Icon(
                    Icons.camera,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Container(
                width: wt * 0.30,
                height: ht * 0.20,
                decoration: BoxDecoration(
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
                      pickImage0(ImageSource.gallery);
                    },
                    child: Icon(
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
                style:
                    GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                OPENFILE,
                style:
                    GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }

  //pan card
  Widget bottomSheetpan() {
    return SingleChildScrollView(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: Container(
          color: Colors.white,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: wt * 0.30,
                      height: ht * 0.20,
                      decoration: BoxDecoration(
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
                          pickImage2(ImageSource.camera);
                        },
                        child: Icon(
                          Icons.camera,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    Container(
                      width: wt * 0.30,
                      height: ht * 0.20,
                      decoration: BoxDecoration(
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
                            pickImage2(ImageSource.gallery);
                          },
                          child: Icon(
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
                      style: GoogleFonts.lato(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      OPENFILE,
                      style: GoogleFonts.lato(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
