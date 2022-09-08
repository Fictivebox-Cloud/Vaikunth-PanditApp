import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/model/getterSetter.dart';
import 'city_screen.dart';
class Servies_you_screen extends StatefulWidget {
  final String? name,mobile;
  final File? photo;



  const Servies_you_screen({Key? key,this.name,this.photo,this.mobile}) : super(key: key);

  @override
  State<Servies_you_screen> createState() => _Servies_you_screenState();
}

class _Servies_you_screenState extends State<Servies_you_screen> {
  var ht,wt;

  var _servicecontroller;

  List<String> _list = ["Puja", "Astrology","Funeral Services"];

  int _selectedIndex = 0;

  Color kPrimaryColor = Color(0xffFF7D33);
  Color kSecondaryColor = Color(0xffCACACA);
  Color kScaffoldBackground = Color(0xffFFF3E9);
  Color p1Color =  Color(0xff6E798C);
  Color white = Color(0xffFFFFFF);
  Color h1Color =Color(0xff343D48);

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
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
                        color: kSecondaryColor
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


                     Text("Services you offer",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),

                  SizedBox(
                    height: 32,
                  ),

                  //Text("Photo url${widget.photo}"),
                  //Text("name${widget.name}"),

                  Container(
                    width: double.infinity,
                      height: 400,
                      child: ListView.separated(itemBuilder: (context, index) => GestureDetector(
                        onTap: (){
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(

                          width: wt*0.9,
                          height: ht* 0.07,


                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: _selectedIndex == index ? kPrimaryColor : h1Color)

                          ),
                          child: Center(child:

                          Text(
                            _list[index],
                            style: GoogleFonts.lato(fontWeight: FontWeight.w500,
                                fontSize: 16),
                          )),
                        ),
                      ), separatorBuilder: (context, index) => SizedBox(
                        height: 12,
                      ), itemCount: _list.length)),



                  // SizedBox(
                  //   height: 12,
                  // ),
                  // GestureDetector(
                  //   onTap: (){
                  //     print("Container clicked second");
                  //   },
                  //   child: Container(
                  //     width: wt*0.9,
                  //     height: ht* 0.07,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(4),
                  //         border: Border.all(color: kSecondaryColor)
                  //
                  //     ),
                  //     child: Center(child: Text("Astrology"
                  //       , style: GoogleFonts.lato(fontWeight: FontWeight.w500,
                  //           fontSize: 16),
                  //     )),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 12,
                  // ),
                  // GestureDetector(
                  //   onTap: (){
                  //     print("Container clicked third");
                  //   },
                  //   child: Container(
                  //     width: wt*0.9,
                  //     height: ht* 0.07,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(4),
                  //         border: Border.all(color: kSecondaryColor)
                  //
                  //     ),
                  //     child: Center(child: Text("Funeral Services"
                  //       , style: GoogleFonts.lato(fontWeight: FontWeight.w500,
                  //           fontSize: 16),
                  //     )),
                  //   ),
                  // )




                ],
              ),
            ),
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

                   // GetterloginSetter s = GetterloginSetter();
                   // s.services =_servicecontroller.text;
                   // print("Bhawani ${s.services}");

                   Navigator.push(context, MaterialPageRoute(builder: (context)=>City_Screen(name3: widget.name,photo3: widget.photo,mobile: widget.mobile)));
                 }, child: Text('Next',style: GoogleFonts.lato(
                 color: Color(0xffFFFFFF),fontSize: 24,
                 fontWeight: FontWeight.w600),)),
              ),
            )

          ],
        ),
      ),
    );
  }
}
