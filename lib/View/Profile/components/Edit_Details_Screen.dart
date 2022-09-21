import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Consts/color1.dart';

import '../../../consts/image_const.dart';
import '../../../consts/text_const.dart';
import '../../../view_model/CityListApi.dart';
import '../../../view_model/Profile/Personal_Detail_View_Model.dart';
import '../../../view_model/Profile/edit_profile_view_model.dart';
import '../../../view_model/Service_VM.dart';


class Edit_Details_Screen extends StatefulWidget {
  final String? servicename;

  Edit_Details_Screen({Key? key, this.servicename}) : super(key: key);

  @override
  State<Edit_Details_Screen> createState() => _Edit_Details_ScreenState();
}

class _Edit_Details_ScreenState extends State<Edit_Details_Screen> {
  var ht, wt;
  int _selectedIndex = 0;
  TextEditingController? _namecontroller;
  TextEditingController? _citycontroller;
  Edit_profile_View_model? edit_profile_view_modelVM;
  City_List_Api? city_list_api;
  Personal_Detail_View_Model? personal_detail_view_model;
  late ServiceVM serviceVM;

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    serviceVM = Provider.of<ServiceVM>(context, listen: false);
    edit_profile_view_modelVM =
        Provider.of<Edit_profile_View_model>(context, listen: false);
    personal_detail_view_model =
        Provider.of<Personal_Detail_View_Model>(context, listen: false);
    personal_detail_view_model!.getpersonalDetailApiCall();
    city_list_api = Provider.of(context, listen: false);

    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text(EDITDETAILS),
        ),
        body: Consumer<Edit_profile_View_model>(
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
                          Center(
                            child: SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: TextField(
                                  cursorColor: colorPrimary,
                                  controller: _namecontroller,
                                  //keyboardType: TextInputType.number,
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
                                        // borderRadius: BorderRadius.circular(25.0),
                                      ),
                                      border: OutlineInputBorder(

                                          //borderRadius: BorderRadius.circular(24)
                                          ))),
                            ),
                          ),
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
                          Center(
                            child: TextField(
                                scrollPadding: EdgeInsets.zero,
                                onChanged: (value) {
                                  _runFilter(value);
                                },
                                cursorColor: colorPrimary,
                                controller: _citycontroller,
                                //keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: grey,
                                  hintText: LOCATION,
                                  hintStyle: TextStyle(fontSize: 15),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: colorPrimary, width: 2.0),
                                    // borderRadius: BorderRadius.circular(25.0),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 100,
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
                    print("Container clickedd");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Edit_Details_Screen(
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
