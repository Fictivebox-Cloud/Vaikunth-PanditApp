

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




import 'package:provider/provider.dart';

import '../../Consts/colors.dart';


import 'Documents_screen.dart';

class City_Screen extends StatefulWidget {
  final String? name3,mobile;
  final File? photo3;



  const City_Screen({Key? key,this.name3,this.photo3, this.mobile}) : super(key: key);

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



  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.white,
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


                        Text("Select your city",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),


                        SizedBox(
                          height: 32,
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

                           cursorColor: colorPrimary,
                            controller: editingController,
                            decoration: InputDecoration(

                                border: InputBorder.none,
                                hintText: "Search for your city",
                                hintStyle: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: kSecondaryColor),

                                prefixIcon: const Icon(Icons.search,color: Color(0xff6E798C),

                                )

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Container(
                            width: double.infinity,

                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: ((context,  index){
                                  final a = [index];
                                  return Card(
                                    child: Text("ghgsh",)
                                  );

                                }))
                        )

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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Documents_Screen(name4: widget.name3,photo4: widget.photo3,mobile: widget.mobile,)));
                      }, child: Text('Next',style: GoogleFonts.lato(
                      color: Color(0xffFFFFFF),fontSize: 24,
                      fontWeight: FontWeight.w600),)),
                ),
              )
            ],
          ),
        )
    );
  }


}






