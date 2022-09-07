import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:panditapp/Viwe/Home/Home_Screen.dart';
import 'package:panditapp/Viwe/Splash_onboarding/splash_screen.dart';

import 'package:panditapp/model/getterSetter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../Consts/colors.dart';

import '../../view_model/ApiCallLogin.dart';


class Account_details extends StatefulWidget {
  final String? aadhar,pancard,name5,mobile;
  final File? photo5,photoaadharfront,photoaadharback,pan;


   Account_details({Key? key,this.aadhar,this.pancard,this.name5,this.photo5,this.mobile,this.photoaadharback,this.photoaadharfront,this.pan}) : super(key: key);

  @override
  State<Account_details> createState() => _Account_detailsState();


}

class _Account_detailsState extends State<Account_details> {
  var ht,wt;




  TextEditingController _accountno = TextEditingController();
  TextEditingController _choosebank = TextEditingController();
  TextEditingController _ifsccode = TextEditingController();

  late GetterloginSetter s;


  @override
  void initState() {
    s = GetterloginSetter();
  }
  //ApiCallLogin api = ApiCallLogin();

  @override
  Widget build(BuildContext context) {



    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    return
       Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: SingleChildScrollView(
                    child: Column(
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
                              color:kPrimaryColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),

                        Text("Account details", style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500, fontSize: 24),),

                        SizedBox(
                          height: 32,
                        ),

                        //Text("${widget.aadhar}"),

                        Text("Account No", style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500, fontSize: 18),),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black
                              )
                          ),
                          child: TextFormField(
                            cursorColor:colorPrimary,
                            controller: _accountno,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xffCACACA,)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Text("Choose Bank", style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500, fontSize: 18),),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black
                              )
                          ),
                          child: TextFormField(
                            cursorColor:colorPrimary,
                            controller: _choosebank,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xffCACACA,)),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(19),
                              FilteringTextInputFormatter.allow(
                                  RegExp("[aA-zZ]")),
                              // FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 36,
                        ),
                        Text("IFSC Code", style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500, fontSize: 18),),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black
                              )
                          ),
                          child: TextFormField(
                            cursorColor:colorPrimary,
                            controller: _ifsccode,
                            decoration: InputDecoration(
                              border: InputBorder.none,

                              hintStyle: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xffCACACA,)),
                            ),

                            inputFormatters: [
                              LengthLimitingTextInputFormatter(19),
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

                // padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.22),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                        color: kPrimaryColor
                    ),
                    child: TextButton(

                        onPressed: () async {
                         // GetterloginSetter s = GetterloginSetter();
                          s.Account = _accountno.text;
                          s.choosebank = _choosebank.text;
                          // s.name = _namecontroller.text;
                          s.ifsc = _ifsccode.text;

                          print("Bhaw Account: ${s.mobile}");
                          print("Bhawaniii Account: ${s.Account}");
                          print("Bhawaniii choosebank: ${s.choosebank}");
                          print("Bhawaniii ifsc: ${s.name}");
                          print("Bhawaniii ifsc: ${s}");
                          // api.fechingloginApi(
                          //   mobile: widget.mobile,
                          //   name: "",
                          //   services: "puja",
                          //   city: "noida",
                          //   aadharnumber: widget.aadhar,
                          //   pannumber:widget.pancard,
                          //   account_number:s.Account,
                          //   bank: s.choosebank,
                          //   ifsc:s.ifsc,
                          //   photo:widget.photo5,
                          //   aadharbackphoto: widget.photoaadharback,
                          //   aadharfrontphoto: widget.photoaadharfront,
                          //   panfile: widget.pan,
                          //
                          // );

                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("name", widget.name5.toString());

                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home_Screen()), (Route<dynamic> route) => false);
                        }, child: Text('Finish', style: GoogleFonts.lato(
                        color: Color(0xffFFFFFF),
                        fontSize: 24,
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