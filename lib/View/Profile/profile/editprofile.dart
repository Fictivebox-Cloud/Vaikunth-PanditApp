import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:panditapp/Consts/text_const.dart';
import 'package:panditapp/consts/image_const.dart';
import 'package:panditapp/model/getterSetter.dart';
import 'package:provider/provider.dart';
import '../../../Consts/themescolor.dart';
import '../../../Util/picture/image.dart';
import '../../../Widgets/circular_loader.dart';
import '../../../view_model/Profile/Personal_Detail_View_Model.dart';


class Editmyprofile extends StatefulWidget {
  final String? name, mobile;

  const Editmyprofile({Key? key, this.name, this.mobile}) : super(key: key);

  @override
  State<Editmyprofile> createState() => _MyAppState();
}

class _MyAppState extends State<Editmyprofile> {
  File? pickedImage;
  var ht, wt;
  late PersonalDetailViewModel? personaldetailviewmodel;


  @override
  void initState() {
    personaldetailviewmodel = Provider.of<PersonalDetailViewModel>(context, listen: false);
    personaldetailviewmodel?.getpersonalDetailApiCall();
  }

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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: wt * 0.30,
                        height: ht * 0.20,
                        decoration: const BoxDecoration(
                            color: CAMERABORDERCOLOR,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: CAMERABORDERCOLOR,
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
                            color: CAMERABORDERCOLOR,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: CAMERABORDERCOLOR,
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
    return Scaffold(
          backgroundColor: white,
          body:
          Consumer<PersonalDetailViewModel>(
            builder: (_, provider, __) => provider.loading
                ? const Center(child: CircularLoader())
                :
            SafeArea(
              child: Container(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Column(
                  children: [
                    Appbar(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [

                            Align(
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      //border: Border.all(color: Color(0XFFFF7D33), width: 5),
                                      borderRadius: BorderRadius.all(
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
                                        width: 134,
                                        height: 134,
                                        fit: BoxFit.cover,
                                      )
                                          : InkWell(
                                        onTap: imagePickerOption,
                                        child: 
                                         Image.network(personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditImage ?? "",
                                           width: 134,
                                         height: 134,
                                           fit: BoxFit.cover,
                                         ),
                                        // Image.asset(
                                        //   ImageConst().UPLOAD_IMAGES,
                                        //   width: 134,
                                        //   height: 134,
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20,),
                            Column(children: [
                              Text(
                            personaldetailviewmodel?.presonalDetailModel
                            ?.response?.panditDetails?.panditFirstName ?? "",
                                style: GoogleFonts.mukta(fontSize: 20,fontWeight: FontWeight.w400),),
                              const SizedBox(height: 6,),
                              Text(
                                personaldetailviewmodel?.presonalDetailModel
                                    ?.response?.panditDetails?.panditMobile ?? "",
                                style: GoogleFonts.mukta(fontSize: 16,fontWeight: FontWeight.w400),),
                            ],),
                            const SizedBox(
                              height: 20,
                            ),

                            Detailcontainer(),

                            // Spacer(),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }

  Widget Appbar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,top: 20,),
      child: Row (children: [
        InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: SvgPicture.asset(IMG().BACKICON)),
        const SizedBox(width: 12,),

        Text(MYPROFILE, style: GoogleFonts.lato(
            fontSize: 20,
            color: h1Color,
            fontWeight: FontWeight.w700),),
        const Spacer(),
        const Icon(Icons.more_vert),

      ],),
    );
  }

  Widget Detailcontainer(){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16,right: 16),
          height: 72,
          width: double.infinity,
          decoration:  BoxDecoration(

            border: Border.all(color:BORDERCOLOR),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(ImageConst().profile),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(FULLNAME,style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text( "${personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditFirstName ?? ""}"
                      "  ${ personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditLastName ?? ""}" ,
                    style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500),),
                ],),
              const Spacer(),
              Text(EDIT,style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w500,color:EDITCOLOR),),
            ],
          ),),
        const SizedBox(height: 14,),
        Container(
          padding: const EdgeInsets.only(left: 16,right: 16),
          height: 72,
          width: double.infinity,
          decoration:  BoxDecoration(

            border: Border.all(color: BORDERCOLOR),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(ImageConst().profile),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(PUJASERVICE,style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(
                   personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditServices ?? "",
                    style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500),),
                ],),
              const Spacer(),
              Text(EDIT,style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w500,color: EDITCOLOR),),
            ],
          ),),
        const SizedBox(height: 14,),
        Container(
          padding: const EdgeInsets.only(left: 16,right: 16),
          height: 72,
          width: double.infinity,
          decoration:  BoxDecoration(

            border: Border.all(color:BORDERCOLOR),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(ImageConst().profile),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AADHARNO,style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(
                  personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditAadhar ?? "",
                    style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500),),
                ],),
              const Spacer(),
              Text(EDIT,style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w500,color: EDITCOLOR),),
            ],
          ),),
        const SizedBox(height: 14,),
        Container(
          padding: const EdgeInsets.only(left: 16,right: 16),
          height: 72,
          width: double.infinity,
          decoration:  BoxDecoration(
            border: Border.all(color:BORDERCOLOR),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              // image: AssetImage(
              //     ImageConst().SUCCESS_GIF
              // ),
              SvgPicture.asset(ImageConst().profile),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(PANNO,style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(
             personaldetailviewmodel?.presonalDetailModel?.response?.panditbanklist?.single.panNo ?? "",
                    style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500),),
                ],),
              const Spacer(),
              Text(EDIT,style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w500,color:EDITCOLOR),),
            ],
          ),),
        const SizedBox(height: 26,),
        Row(children: [
          Text(PERMANENTADDRESS,style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w400),),
          const Spacer(),
          Text(EDIT,style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w500,color:EDITCOLOR),),
          const SizedBox(width: 16,)
        ],),
        const SizedBox(height: 9,),
        Text("H-157 Rally infra appartment, Rally Infra Building, 00001 – 99950",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w400),),
        const SizedBox(height: 8,),
        const Divider(),
        const SizedBox(height: 37,),
        Buttons(),
        const SizedBox(height: 30,),
      ],
    );
  }

  Widget Buttons(){
    return  Row(children: [
      Expanded(
        flex: 1,
        child: Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
              border: Border.all(color: BUTTONBORDERCOLOR),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white),
          child: TextButton(
              onPressed: () {

              },
              child: Text(
                CANCEL,
                style: GoogleFonts.lato(
                    color: CANCELCOLOR,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )),
        ),
      ),
      const SizedBox(width: 16,),
      Expanded(
        flex: 1,
        child: Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: kPrimaryColor),
          child: TextButton(
              onPressed: () {
                GetterloginSetter getterloginsetter =
                GetterloginSetter();
                getterloginsetter.Photo = pickedImage;
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Servies_you_screen(
                //           photo: pickedImage,
                //             ))
                // );
              },
              child: Text(
                SAVE,
                style: GoogleFonts.lato(
                    color: white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              )),
        ),
      ),
    ],);

  }
}

