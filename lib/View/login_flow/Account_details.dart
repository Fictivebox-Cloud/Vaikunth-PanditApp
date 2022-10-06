import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Consts/text_const.dart';

import 'package:panditapp/View/Home/Home_Screen.dart';

import 'package:panditapp/model/getterSetter.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Bank_List_VM.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../Util/login_in_User.dart';
import '../../consts/themescolor.dart';
import '../../view_model/Login/ApiCallLogin.dart';
import '../../view_model/BookingViewDetails/Complete_Bookings.dart';
import '../../view_model/Earnings_View_Model/Earnings_Home_VM.dart';

class Accountdetails extends StatefulWidget {
  final String? aadhar, pancard, name5, mobile, servicesname;
  final File? photo5, photoaadharfront, photoaadharback, pan;

  Accountdetails({
    Key? key,
    this.aadhar,
    this.pancard,
    this.name5,
    this.photo5,
    this.mobile,
    this.photoaadharback,
    this.photoaadharfront,
    this.pan,
    this.servicesname,
  }) : super(key: key);

  @override
  State<Accountdetails> createState() => _AccountdetailsState();
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


class _AccountdetailsState extends State<Accountdetails> {
  var ht, wt;

  TextEditingController _accountno = TextEditingController();
  TextEditingController _choosebank = TextEditingController();
  TextEditingController _ifsccode = TextEditingController();

  late GetterloginSetter _getterloginSetter;

  List<dynamic> countries = [];
  String? countryId;
  late BankListVM bankList_VM;

  countryList() {
    setState(() {
      print("length ${bankList_VM.bankListModel?.response!.banklist!.length}");
      bankList_VM.bankListModel?.response!.banklist!.forEach((element) {
        countries.add({"id": element.id, "label": element.bankName});
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.countries.add({"id": 1, "label": "Bank of India"});
    this.countries.add({"id": 2, "label": "Bank of Baroda"});
    this.countries.add({"id": 3, "label": "Punjab National Bank"});
    this.countries.add({"id": 4, "label": "Kotak Mahindra Bank"});
    this.countries.add({"id": 5, "label": "Axis Bank"});
    this.countries.add({"id": 6, "label": "ICICI Bank"});
    this.countries.add({"id": 7, "label": "State Bank of India"});

    _getterloginSetter = GetterloginSetter();
  }

/*
  @override
  void initState() {
    s = GetterloginSetter();
  }*/

  ApiCallLogin api = ApiCallLogin();

  @override
  Widget build(BuildContext context) {
    //ServiceVM serviceVM = context.watch<ServiceVM>();
    bankList_VM = context.watch<BankListVM>();
    //countryList();
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                  child:
                      //single childscroll view
                      Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                            color: kPrimaryColor,
                          ),
                          Container(
                            width: 48,
                            height: 2,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),

                      Text(
                        ACCOUNT_DETAILS,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500, fontSize: 24),
                      ),

                      SizedBox(
                        height: 32,
                      ),

                      //Text("${widget.aadhar}"),

                      Text(
                        ACCOUNT_NO,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 48,
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(4),
                        //     border: Border.all(width: 1, color: h1Color)),
                        child: TextField(
                          cursorColor: colorPrimary,
                          controller: _accountno,
                          decoration: InputDecoration(
                            //prefixIcon: const Icon(Icons.search,color: p1Color,),
                              fillColor: grey,
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

                            FilteringTextInputFormatter.deny(
                                RegExp(r'\s')),
                            LengthLimitingTextInputFormatter(18),
                            //UpperCaseTextFormatter(),
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9]")),
                          ],
                          textCapitalization:TextCapitalization.characters,
                        ),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      Text(
                        CHOOSE_BANK,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: FormHelper.dropDownWidget(
                          context,

                          "Select Bank",
                          this.countryId,
                          this.countries,
                          (onChangedVal) {
                            this.countryId = onChangedVal;
                            print("Selected Country: $onChangedVal");
                          },
                          (onValidateVal) {
                            if (onValidateVal == null) {
                              return "please select Bank";
                            }
                            return null;
                          },
                          borderColor: kSecondaryColor,
                          borderFocusColor: colorPrimary,
                          borderRadius: 4,
                          optionValue: "id",
                          // optionValue:bankList_VM.bankListModel!.response!.banklist![0].id.toString(),
                          //optionLabel:bankList_VM.bankListModel!.response!.banklist![0].bankName.toString(),
                          optionLabel: "label",
                        ),
                      ),

                      SizedBox(
                        height: 36,
                      ),
                      Text(
                        IFSC_CODE,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 48,
                        child:
                        TextField(
                          cursorColor: colorPrimary,
                          controller: _ifsccode,
                          decoration: InputDecoration(
                              //prefixIcon: const Icon(Icons.search,color: p1Color,),
                              fillColor: grey,
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

                              FilteringTextInputFormatter.deny(
                                  RegExp(r'\s')),
                            LengthLimitingTextInputFormatter(10),
                            UpperCaseTextFormatter(),
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-z A-Z 0-9]")),
                          ],
                          textCapitalization:TextCapitalization.characters,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),

              // padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.22),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: kPrimaryColor),
                  child: TextButton(
                      onPressed: () async {
                        // GetterloginSetter s = GetterloginSetter();
                        _getterloginSetter.Account = _accountno.text;
                        _getterloginSetter.choosebank = _choosebank.text;
                        // s.name = _namecontroller.text;
                        _getterloginSetter.ifsc = _ifsccode.text;



                        api.fechingloginApi(
                          mobile: widget.mobile,
                          name: widget.name5,
                          services: widget.servicesname,
                          city: "noida",
                          aadharnumber: widget.aadhar,
                          pannumber: widget.pancard,
                          account_number: _getterloginSetter.Account,
                          bank: this.countries,
                          ifsc: _getterloginSetter.ifsc,
                          photo: widget.photo5,
                          aadharbackphoto: widget.photoaadharback,
                          aadharfrontphoto: widget.photoaadharfront,
                          panfile: widget.pan,
                        );

                        LoggedInUserBloc.instance().getUserId();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (Route<dynamic> route) => false);
                      },
                      child: Text(
                        FINISH,
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
}
