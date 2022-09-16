

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/view_model/CityListApi.dart';
import 'package:provider/provider.dart';
import '../../Consts/color1.dart';
import '../../Consts/text_const.dart';
import 'Documents_screen.dart';

class City_Screen extends StatefulWidget {
  final String? name3,mobile,servicesname;
  final File? photo3;



  const City_Screen({Key? key,this.name3,this.photo3, this.mobile,this.servicesname}) : super(key: key);

  @override
  State<City_Screen> createState() => _City_ScreenState();
}
class _City_ScreenState extends State<City_Screen> {
  var ht,wt;
  late List _city;
  TextEditingController editingController = TextEditingController();
  late String textValue;
  late Timer timeHandle;
  // var items = List<String>();
 late  City_List_Api? city_list_api;
  @override
  Widget build(BuildContext context) {
    city_list_api = context.watch<City_List_Api>();
    return Scaffold(
        backgroundColor:white,
        body: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
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
                                color: kPrimaryColor
                            ),
                            Container(
                                width: 48,
                                height: 2,
                                color: kPrimaryColor
                            ),
                            Container(
                                width: 48,
                                height: 2,
                                color: kPrimaryColor
                            ),
                            Container(
                                width: 48,
                                height: 2,
                                color: kPrimaryColor
                            ),
                            Container(
                                width: 48,
                                height: 2,
                                color: kSecondaryColor
                            ),
                            Container(
                                width: 48,
                                height: 2,
                                color: kSecondaryColor
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(SELECTYOURCITY,style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          height: 48,
                          child:
                          TextField(
                              cursorColor: colorPrimary,
                              controller: editingController,
                              //keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search,color: p1Color,),
                                  fillColor:grey,
                                  hintText:SEARCH_YOUR_CITY,
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
                              )
                          ),
                        ),

                     // Text("${widget.servicesname}"),
                        SizedBox(
                          height: 30,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 24),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: kPrimaryColor
                  ),
                  child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Documents_Screen(name4: widget.name3,photo4: widget.photo3,mobile: widget.mobile,servicesname:widget.servicesname)));
                      }, child: Text(NEXT,style: GoogleFonts.lato(
                      color:white,fontSize: 24,
                      fontWeight: FontWeight.w600),)),
                ),
              )
            ],
          ),
        )
    );
  }
}






