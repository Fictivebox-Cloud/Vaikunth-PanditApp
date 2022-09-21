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

import '../../Consts/color1.dart';
import '../../view_model/Login/ApiCallLogin.dart';
import '../../view_model/BookingViewDetails/Complete_Bookings.dart';
import '../../view_model/Earnings_View_Model/Earnings_Home_VM.dart';

class Account_details extends StatefulWidget {
  final String? aadhar, pancard, name5, mobile,servicesname;
  final File? photo5, photoaadharfront, photoaadharback, pan;

  Account_details(
      {Key? key,
      this.aadhar,
      this.pancard,
      this.name5,
      this.photo5,
      this.mobile,
      this.photoaadharback,
      this.photoaadharfront,
      this.pan,
      this.servicesname,
      })
      : super(key: key);


  @override
  State<Account_details> createState() => _Account_detailsState();
}

class _Account_detailsState extends State<Account_details> {
  var ht, wt;

  TextEditingController _accountno = TextEditingController();
  TextEditingController _choosebank = TextEditingController();
  TextEditingController _ifsccode = TextEditingController();

  late GetterloginSetter s;


  List<dynamic> countries=[];
  String? countryId;
  late BankList_VM bankList_VM;

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
    this.countries.add({"id":1, "label": "Bank of India"});
    this.countries.add({"id":2, "label": "Bank of Baroda"});
    this.countries.add({"id":3, "label": "Punjab National Bank"});
    this.countries.add({"id":4, "label": "Kotak Mahindra Bank"});
    this.countries.add({"id":5, "label": "Axis Bank"});
    this.countries.add({"id":6, "label": "ICICI Bank"});
    this.countries.add({"id":7, "label": "State Bank of India"});


    s = GetterloginSetter();
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
    bankList_VM = context.watch<BankList_VM>();
    //countryList();
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child:
                //single childscroll view
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(width: 1, color: h1Color)),
                      child: TextFormField(
                        cursorColor: colorPrimary,
                        controller: _accountno,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color:kSecondaryColor
                          ),
                        ),
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
                      child: FormHelper.dropDownWidget(context,

                        "Select Bank",
                        this.countryId,
                       this.countries,
                            (onChangedVal){
                          this.countryId=onChangedVal;
                          print("Selected Country: $onChangedVal");
                        },
                            (onValidateVal){
                          if(onValidateVal == null){
                            return "please select Bank";
                          }
                          return null;
                        },
                        borderColor: kSecondaryColor,
                        borderFocusColor: colorPrimary,
                        borderRadius:4,
                        optionValue:"id",
                       // optionValue:bankList_VM.bankListModel!.response!.banklist![0].id.toString(),
                        //optionLabel:bankList_VM.bankListModel!.response!.banklist![0].bankName.toString(),
                        optionLabel:"label",

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
                      child: TextField(
                        cursorColor: colorPrimary,
                        controller: _ifsccode,
                        decoration: InputDecoration(
                          //prefixIcon: const Icon(Icons.search,color: p1Color,),
                            fillColor:grey,
                            hintStyle: GoogleFonts.lato(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: kSecondaryColor),

                            focusedBorder:OutlineInputBorder(
                              borderSide: const BorderSide(color: colorPrimary, width: 2.0),
                              // borderRadius: BorderRadius.circular(25.0),
                            ),

                            border: OutlineInputBorder(

                              //borderRadius: BorderRadius.circular(24)
                            )
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-z A-Z 0-9]")),
                        ],
                      ),
                    ),


                  ],
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
                        CompleteBookingViewModel completeBookingViewModel = Provider.of<CompleteBookingViewModel>(context, listen: false);
                        completeBookingViewModel.completebookingAPIcall();

                        Earnings_Home_VM earninghome= Provider.of<Earnings_Home_VM>(context,listen: false);
                        earninghome.earningshomeAPIcall();
                        // GetterloginSetter s = GetterloginSetter();
                        s.Account = _accountno.text;
                        s.choosebank = _choosebank.text;
                        // s.name = _namecontroller.text;
                        s.ifsc = _ifsccode.text;

                        print("Bhaw Account: ${s.mobile}");

                        api.fechingloginApi(
                          mobile: widget.mobile,
                          name: widget.name5,
                          services:widget.servicesname,
                          city: "noida",
                          aadharnumber: widget.aadhar,
                          pannumber: widget.pancard,
                          account_number: s.Account,
                          bank: this.countries,
                          ifsc: s.ifsc,
                          photo: widget.photo5,
                          aadharbackphoto: widget.photoaadharback,
                          aadharfrontphoto: widget.photoaadharfront,
                          panfile: widget.pan,
                        );

                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString("name", widget.name5.toString());

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home_Screen()));
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home_Screen()), (Route<dynamic> route) => false);
                      },
                      child: Text(
                        FINISH,
                        style: GoogleFonts.lato(
                            color:white,
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



