import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../consts/image_const.dart';
import '../../../consts/text_const.dart';
import '../../../consts/themescolor.dart';
import '../../../model/Login Model/city_model.dart';
import '../../../repo/api_remote_services.dart';
import '../../../view_model/Login/CityListApi.dart';
import '../../../view_model/Profile/Personal_Detail_View_Model.dart';
import '../../../view_model/Profile/edit_profile_view_model.dart';
import '../../../view_model/Login/Service_VM.dart';

import 'package:http/http.dart' as http;




class EditDetailsScreen extends StatefulWidget {
  final String? servicename;

  EditDetailsScreen({Key? key, this.servicename}) : super(key: key);

  @override
  State<EditDetailsScreen> createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  var ht, wt;
  int _selectedIndex = 0;
  TextEditingController? _namecontroller;
  TextEditingController? _citycontroller;
  EditProfileViewModel? edit_profile_view_modelVM;
  CityListApi? city_list_api;
  PersonalDetailViewModel? personal_detail_view_model;
  late ServiceVM serviceVM;



  void initState(){
    super.initState();
    _getDataFromApi();
  }

  Modelapi? modelapi;
  void _getDataFromApi()async{
    var respones = await http.get(Uri.parse('https://vaikunth.fictivebox.com/api/'));


    setState(() {
      city_list_api!.getCityListApiCall();
    });
  }


  Widget fastTextFiledDesgin(){
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: TextField(
            cursorColor: colorPrimary,
            controller: _namecontroller,
            decoration: InputDecoration(
                fillColor: grey,
                hintText: personal_detail_view_model
                    ?.presonalDetailModel
                    ?.response
                    ?.panditDetails
                    ?.panditFirstName ??
                    "",
                hintStyle: TextStyle(fontSize: 15),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: colorPrimary, width: 2.0),
                ),
                border: const OutlineInputBorder(

                  //borderRadius: BorderRadius.circular(24)
                ))),
      ),
    );
  }
  Widget servicesOfferedDesgin(){
    return Column(
      children: [
        Row(
          children: [
            Image.asset(ImageConst().CHOPADA_PUJAN_BOOK),
            SizedBox(
              width: 23,
            ),
            Text(
              personal_detail_view_model
                  ?.presonalDetailModel
                  ?.response
                  ?.panditDetails
                  ?.panditServices ??
                  "",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: kPrimaryColor),
            )
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Row(
          children: [
            Image.asset(ImageConst().CEMETERYE),
            SizedBox(
              width: 23,
            ),
            Text(
              FUNERALSERVICES,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: kPrimaryColor),
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
        DottedBorder(
            borderType: BorderType.RRect,
            strokeWidth: 2,
            dashPattern: [6, 3, 2, 3],
            color: kPrimaryColor,
            radius: Radius.circular(4),
            child: ClipRRect(
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (builder) => bottomSheet(),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 46,
                  child: Center(
                      child: Text(
                        ADDREMOVESERVICES,
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor),
                      )),
                ),
              ),
            )),
      ],
    );
  }

  Widget cityTextFiledDesgin(){

    return Container(
      child: Autocomplete<Citylist>(
        optionsBuilder: (TextEditingValue value){
          return
           // modelapi!.data!.where((element) => element.firstName!.toLowerCase().contains(value.text.toLowerCase())).toList();
           modelapi!.response?.where((element) => element.firstName!.toLowerCase().contains(value.text.toLowerCase())).toList();
        },
        onSelected: (value)=> print(value.name),
        displayStringForOption: (Citylist d)=> '${d.name!} ${d.name !}',
      ),
    );
  }


  Widget build(BuildContext context) {
    serviceVM = Provider.of<ServiceVM>(context, listen: false);
    edit_profile_view_modelVM =
        Provider.of<EditProfileViewModel>(context, listen: false);
    personal_detail_view_model =
        Provider.of<PersonalDetailViewModel>(context, listen: false);
    personal_detail_view_model!.getpersonalDetailApiCall();
    city_list_api = Provider.of(context, listen: false);

    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text(EDITDETAILS),
        ),
        body: Consumer<EditProfileViewModel>(
          builder: (context, provider, child) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NAME,
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: h1Color),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          fastTextFiledDesgin(),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            SERVICES_OFFERED,
                            style: GoogleFonts.lato(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 9.0,
                          ),
                          servicesOfferedDesgin(),
                          SizedBox(
                            height: 44,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                CITY,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                EDIT,
                                style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimaryColor),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          cityTextFiledDesgin(),
                          SizedBox(
                            height: 250,
                          ),
                          provider.loading
                              ? Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    print("Container clickedd");
                                    edit_profile_view_modelVM
                                        ?.fachingEditDetailsModel(
                                            pandit_name: _namecontroller,
                                            pandit_city: _citycontroller,
                                            pandit_services: _selectedIndex);
                                  },
                                  child: Container(
                                    width: wt * 0.9,
                                    height: ht * 0.07,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: kPrimaryColor),
                                    child: Center(
                                        child: Text(
                                          SAVE,
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: white),
                                    )),
                                  ),
                                )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget bottomSheet() {
    return Expanded(
      child: Consumer<ServiceVM>(
        builder: (context, provider, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  SERVICES_OFFERED,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: kSecondaryColor),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  ADREMOVESERVICE,
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: h1Color),
                ),
                SizedBox(
                  height: 12,
                ),

                Expanded(
                  child: Container(
                      width: double.infinity,
                      height: 500,
                      child: ListView.separated(
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  provider.setIndex(index);
                                },
                                child: Container(
                                  width: wt * 0.9,
                                  height: ht * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: provider.index == index
                                              ? kPrimaryColor
                                              : kSecondaryColor)),
                                  child: Center(
                                      child: Text(
                                    provider.serviceModel!.response!
                                        .serviceslist![index].name
                                        .toString(),
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  )),
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 12,
                              ),
                          itemCount: provider
                              .serviceModel!.response!.serviceslist!.length)),
                ),
                //Spacer(),

                GestureDetector(
                  onTap: () {

                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditDetailsScreen(
                                  servicename: provider.serviceModel!.response!
                                      .serviceslist![_selectedIndex].name,
                                )));

                  },
                  child: Container(
                    width: wt * 0.9,
                    height: ht * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: kPrimaryColor),
                    child: Center(
                        child: Text(
                      SAVE,
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: white),
                    )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
