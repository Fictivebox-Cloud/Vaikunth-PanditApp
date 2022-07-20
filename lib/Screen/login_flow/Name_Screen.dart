import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Phone_Auth/auth_cubit.dart';
import 'package:panditapp/Phone_Auth/auth_state.dart';
import 'package:panditapp/Screen/login_flow/Phone_Number.dart';
import 'package:panditapp/Screen/login_flow/Photo_Upload.dart';


class Name_Screen extends StatefulWidget {
  const Name_Screen({Key? key}) : super(key: key);

  @override
  State<Name_Screen> createState() => _Name_ScreenState();
}

class _Name_ScreenState extends State<Name_Screen> {
  var ht,wt;

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
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text("Name",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),
                    ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Center(
                    child: SizedBox(
                      height: ht * 0.4,
                      //width: wt * 0.8,
                      child: TextField(
                        //keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            hintText:'Enter Your Name',
                            hintStyle: TextStyle(fontSize: 15),

                            border: OutlineInputBorder(

                              //borderRadius: BorderRadius.circular(24)
                            )
                        )
                      )
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Photo_Upload()));
                      }, child: Text('Next',style: GoogleFonts.lato(
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