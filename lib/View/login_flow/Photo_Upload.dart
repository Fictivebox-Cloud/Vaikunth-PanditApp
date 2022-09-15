import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:panditapp/Consts/text_const.dart';
import 'package:panditapp/View/login_flow/Servies_you_provide.dart';

import 'package:panditapp/model/getterSetter.dart';
import 'package:provider/provider.dart';

import '../../Consts/color1.dart';
import '../../view_model/Bank_List_VM.dart';
import '../../view_model/Pandit_Bank_List_VM.dart';
import '../../view_model/Service_VM.dart';



class Photo_Upload extends StatefulWidget {
  final String? name,mobile;

  const Photo_Upload({Key? key,this.name,this.mobile}) : super(key: key);

  @override
  State<Photo_Upload> createState() => _MyAppState();
}

class _MyAppState extends State<Photo_Upload> {
  File? pickedImage;
  var ht,wt;
  // var _photocontroller = TextEditingController();



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
               child:Column(
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
                                  color: Color(0xffECF1F6)
                                  ,
                                  blurRadius: 10,
                                  spreadRadius: 1
                                  ,offset: Offset(4,4)
                              )
                            ]
                        ),
                        child:  InkWell(
                          onTap: (){
                            pickImage(ImageSource.camera);
                          },
                          child: Icon(Icons.camera,color: kPrimaryColor,),

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
                                  color: Color(0xffECF1F6)
                                  ,
                                  blurRadius: 10,
                                  spreadRadius: 1
                                  ,offset: Offset(4,4)
                              )
                            ]
                        ),
                        child: InkWell(
                            onTap: (){
                              pickImage(ImageSource.gallery);
                            },
                            child: Icon(Icons.folder_open,color: kPrimaryColor,)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(OPENCAMERA,style: GoogleFonts.lato(fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),),
                      Text(OPENFILE,style: GoogleFonts.lato(fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),)
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
//final result = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
//                   if (result == null) return;
//                   final file = result.path;
//                   setState(() {
//                     _fileUpload = file;
//                   });//
  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType,imageQuality: 20);
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
    return
      WillPopScope(
        onWillPop:() async =>true,
        child: GetMaterialApp(
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
                      child: Text(PHOTO,style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(UPLOADYOURPHOTO,style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff343D48)),),
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
                      child:
                      ClipOval(
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
                            : Image.network('https://i.pinimg.com/564x/36/4b/c4/364bc4cb56b6a7856d9ced80373d5be8.jpg',
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

                          child:
                          Image.asset("assets/images/Camera.png",height: 33,width: 33,color: Color(0XFFFF7D33),)),

                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //Text("NAme: ${widget.name}"),
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
                          ServiceVM serviceVM = Provider.of<ServiceVM>(context,listen: false);
                          serviceVM.serviceAPIcall();

                          BankList_VM banklist= Provider.of<BankList_VM>(context,listen: false);
                          banklist.bankListAPIcall();

                          Pandit_Bank_List_VM panditbanklist= Provider.of<Pandit_Bank_List_VM>(context,listen: false);
                          panditbanklist.panditbankListAPIcall();


                          GetterloginSetter s = GetterloginSetter();
                          s.Photo = pickedImage;
                          print("abhi ${s.Photo}");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Servies_you_screen(name: widget.name,photo:pickedImage,mobile: widget.mobile)));
                        }, child: Text(NEXT,style: GoogleFonts.lato(
                        color: white,fontSize: 24,
                        fontWeight: FontWeight.w600),)),
                  ),

                ),
              )
            ],
          ),
        ),

    ),
      );
  }
}
