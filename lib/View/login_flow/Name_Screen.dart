import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Consts/text_const.dart';
import 'package:panditapp/View/login_flow/Photo_Upload.dart';
import 'package:panditapp/model/getterSetter.dart';

import '../../Consts/color1.dart';







class Name_Screen extends StatefulWidget {
  String? mobile;
   Name_Screen({Key? key, this.mobile}) : super(key: key);

  @override
  State<Name_Screen> createState() => _Name_ScreenState();
}

class _Name_ScreenState extends State<Name_Screen> {
  var ht,wt;



  var isLoading =true.obs;
  var _namecontroller = TextEditingController();

  //final TextEditingController _namecontroller = TextEditingController();

  @override
  void dispose() {
    _namecontroller.dispose();
    //super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor:white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            Container(
                              width: 48,
                              height: 2,
                              color:kPrimaryColor,
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

                     // Text("Mobile${widget.mobile}"),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(NAME,style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16),
                        child: Center(
                          child: SizedBox(
                              height:48,
                              child:
                              TextField(
                                  cursorColor: colorPrimary,
                                  controller: _namecontroller,
                                  //keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      fillColor:grey,
                                      hintText:ENTERYOURNAME,
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

                        onPressed: (){

                          // Verification_Number_Api vv=Verification_Number_Api();
                          // vv.fachingApiVerificationnumber();

                          GetterloginSetter s = GetterloginSetter();
                          s.name = _namecontroller.text;
                          print("Bhawani ${s.name}");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Photo_Upload(name:_namecontroller.text,mobile: widget.mobile,)));
                        }, child: Text(NEXT,style: GoogleFonts.lato(
                        color: white,fontSize: 24,
                        fontWeight: FontWeight.w600),)),
                  ),

                ),
              )
            ],
          ),
        )

    );
  }
}