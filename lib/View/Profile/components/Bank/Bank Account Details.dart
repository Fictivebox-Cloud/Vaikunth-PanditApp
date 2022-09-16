import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../../Consts/color1.dart';
import '../../../../view_model/Pandit_Bank_List_VM.dart';

class Bank_Account_Screen extends StatefulWidget {
  const Bank_Account_Screen({Key? key}) : super(key: key);

  @override
  State<Bank_Account_Screen> createState() => _Bank_Account_ScreenState();
}

class _Bank_Account_ScreenState extends State<Bank_Account_Screen> {

  List<dynamic> countries=[];
  String? couuntryId;

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

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Hero(
            tag: "_text",
            child: Text("Bank Account Details"))),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          
          child:
          Container(
           padding: EdgeInsets.only(left: 16,right: 16),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Account No",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18,
                    color: h1Color),),

                SizedBox(
                  height: 8,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 0,right: 0),
                  child: Center(
                    child: SizedBox(
                      height:48,
                      child:
                      TextField(
                          cursorColor: colorPrimary,
                          //controller: _namecontroller,
                          //keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              fillColor:grey,
                              hintText:"Account No.",
                              hintStyle: TextStyle(fontSize: 15),

                              focusedBorder:OutlineInputBorder(
                                borderSide: const BorderSide(color: colorPrimary, width: 2.0),
                                // borderRadius: BorderRadius.circular(25.0),
                              ),


                              border: OutlineInputBorder(

                                //borderRadius: BorderRadius.circular(24)
                              )
                          )
                      ),

                    ),
                  ),
                ),

                SizedBox(
                  height: 36,
                ),
                Text("Choose Bank",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w500,color: h1Color),),
                SizedBox(
                  height: 8,
                ),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FormHelper.dropDownWidget(context,

                    "Select Bank",
                    this.couuntryId,
                    this.countries,
                        (onChangedVal){
                      this.couuntryId=onChangedVal;
                      print("Selected Bank: $onChangedVal");
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
                    optionLabel:"label",

                  ),
                ),


                SizedBox(
                  height: 36,
                ),
                Text("IFSC Code",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18,
                    color: h1Color),),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0,right: 0),
                  child: Center(
                    child: SizedBox(
                      height:48,
                      child:
                      TextField(
                          cursorColor: colorPrimary,
                          //controller: _namecontroller,
                          //keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              fillColor:grey,
                              hintText:"IFSC CODE",
                              hintStyle: TextStyle(fontSize: 15),

                              focusedBorder:OutlineInputBorder(
                                borderSide: const BorderSide(color: colorPrimary, width: 2.0),
                                // borderRadius: BorderRadius.circular(25.0),
                              ),


                              border: OutlineInputBorder(

                                //borderRadius: BorderRadius.circular(24)
                              )
                          )
                      ),

                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ));
  }
}
