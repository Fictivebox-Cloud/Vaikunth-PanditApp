import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:panditapp/consts/image_const.dart';
import 'package:panditapp/consts/text_const.dart';
import '../../consts/themescolor.dart';
import 'service_screen.dart';

class PhotoUpload extends StatefulWidget {
  final String? name, mobile;
  const PhotoUpload({Key? key, this.name, this.mobile}) : super(key: key);

  @override
  State<PhotoUpload> createState() => _PhotoUploadState();
}

class _PhotoUploadState extends State<PhotoUpload> {
  File? pickedImage;
  var ht, wt;

  void imagePickerOption() {
    showMaterialModalBottomSheet(
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
              padding: EdgeInsets.symmetric(vertical: ht * 0.01,),
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
                            pickImage(ImageSource.camera);
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
                              pickImage(ImageSource.gallery);
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

  pickImage(ImageSource imageType) async {
    try {
      final photo =
      await ImagePicker().pickImage(source: imageType, imageQuality: 20);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
      Navigator.pop(context);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Widget stepContainer({Color? color}) {
    return Container(
      width: wt * 0.12,
      height: 4,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40)
      ),
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            alignment: Alignment.center,
            elevation: MaterialStateProperty.resolveWith((states) => 0.0),
            padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.symmetric(
                    vertical: 13, horizontal: wt * 0.15
                )),
            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
              side: const BorderSide(
                color: divider,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            )),
            backgroundColor:
            MaterialStateColor.resolveWith((states) => white),
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
            elevation: MaterialStateProperty.resolveWith((states) => pickedImage != null ? 5.0 : 0.0),
            padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.symmetric(
                    vertical: 13, horizontal: wt * 0.15
                )),
            shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
              side: BorderSide(
                color: pickedImage != null ? colorPrimary : divider,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            )),
            backgroundColor:
            MaterialStateColor.resolveWith((states) => pickedImage != null ? colorPrimary : white),
          ),
          onPressed: () {
            pickedImage != null ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceScreen(
                        name: widget.name,
                        photo: pickedImage,
                        mobile: widget.mobile))) : null;
          },
          child: Text(
            NEXT,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: pickedImage != null ? white : dividerr,
            ),
          ),
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
                      stepContainer(color: kSecondaryColor,),
                      stepContainer(color: kPrimaryColor,),
                      stepContainer(color: kSecondaryColor,),
                      stepContainer(color: kSecondaryColor,),
                      stepContainer(color: kSecondaryColor,),
                      stepContainer(color: kSecondaryColor,),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    FILL_YOUR_PROFILE_DETAILS,
                    style: GoogleFonts.poppins(
                        color: h1Color,
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    CLICK_PICTURE,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: p1Color),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipOval(
                          child:
                          pickedImage != null
                              ? Image.file(
                            pickedImage!,
                            width: 170,
                            height: 170,
                            fit: BoxFit.cover,
                          )
                              : InkWell(
                            onTap: imagePickerOption,
                            child: Image.asset(
                              ImageConst().UPLOAD_IMAGES,
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        pickedImage != null ? Positioned(
                            bottom: 20,
                            right: 0,
                            child: InkWell(
                              onTap: imagePickerOption,
                              child: SvgPicture.asset(
                                ImageConst().EDIT_PROFILE,
                              ),
                            )) : Container(),
                      ],
                    ),
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
}