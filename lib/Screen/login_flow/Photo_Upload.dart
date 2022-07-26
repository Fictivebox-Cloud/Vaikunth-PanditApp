import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:panditapp/Screen/login_flow/Servies_you_provide.dart';
import 'package:panditapp/model/getterSetter.dart';

void main() {
  runApp(const Photo_Upload());
}

class Photo_Upload extends StatefulWidget {
  const Photo_Upload({Key? key}) : super(key: key);

  @override
  State<Photo_Upload> createState() => _MyAppState();
}

class _MyAppState extends State<Photo_Upload> {
  File? pickedImage;
  var ht,wt;
  // var _photocontroller = TextEditingController();

  Color kPrimaryColor = Color(0xffFF7D33);
  Color kSecondaryColor = Color(0xffCACACA);
  Color kScaffoldBackground = Color(0xffFFF3E9);
  Color p1Color =  Color(0xff6E798C);
  Color white = Color(0xffFFFFFF);
  Color h1Color =Color(0xff343D48);

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(

                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),


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
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home:Scaffold(
        backgroundColor: Colors.white,
        body:


        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16,top: 34),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Container(

                          width: 48,
                          height: 2,
                          color: kPrimaryColor,
                        ),
                        Container(

                          width: 48,
                          height: 2,
                          color: kPrimaryColor,
                        ),
                        Container(

                          width: 48,
                          height: 2,
                          color: kSecondaryColor,
                        ),
                        Container(

                          width: 48,
                          height: 2,
                          color: kSecondaryColor,
                        ),
                        Container(

                          width: 48,
                          height: 2,
                          color: kSecondaryColor,
                        ),
                        Container(

                          width: 48,
                          height: 2,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("Photo",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text("Upload your photo",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff343D48)),),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  // imageProfile(),



                ],
              ),
            ),



            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(

                    decoration: BoxDecoration(
                      //border: Border.all(color: Color(0XFFFF7D33), width: 5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ClipOval(
                      // controller: _phonecontroller,
                      child:
                      //pickedImage != null ? Image.file(pickedImage!):
                      pickedImage != null
                          ? Image.file(
                        pickedImage!,
                        width: 170,
                        height: 170,
                        fit: BoxFit.cover,
                      )
                          : Image.network('https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                        width: 170,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 9,
                    right: 15,
                    child:
                    InkWell(
                        onTap:
                        imagePickerOption,

                        child: Image.asset("assets/images/settings.png")),

                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,bottom: 24),
              child: Container(

                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),

                      color: kPrimaryColor
                  ),
                  child: TextButton(
                    // File? pickedImage;
                      onPressed: (){

                        GetterloginSetter s = GetterloginSetter();
                        s.Photo = pickedImage;
                        print("abhi ${s.Photo}");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Servies_you_screen()));
                      }, child: Text('Next',style: GoogleFonts.lato(
                      color: white,fontSize: 24,
                      fontWeight: FontWeight.w600),)),
                ),

              ),
            )
          ],
        ),
      ),

    );
  }
}
