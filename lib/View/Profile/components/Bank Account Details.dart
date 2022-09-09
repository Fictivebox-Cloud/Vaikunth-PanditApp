import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Consts/color1.dart';

class Bank_Account_Screen extends StatefulWidget {
  const Bank_Account_Screen({Key? key}) : super(key: key);

  @override
  State<Bank_Account_Screen> createState() => _Bank_Account_ScreenState();
}

class _Bank_Account_ScreenState extends State<Bank_Account_Screen> {




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
          
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Account No",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18,
                    color: h1Color),),
                SizedBox(
                  height: 8,
                ),

                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: white,

                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1,
                        color: kSecondaryColor

                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(

                      decoration: InputDecoration(

                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.lato(
                        fontSize: 16,fontWeight: FontWeight.w500,
                        color: Colors.black),
                      keyboardType: TextInputType.number,
                   
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

                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: white,

                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1,
                        color: kSecondaryColor

                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("917704087638",style: GoogleFonts.lato(
                        fontSize: 16,fontWeight: FontWeight.w500,
                        color: kSecondaryColor),),
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
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: white,

                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1,
                        color: kSecondaryColor

                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("917704087638",style: GoogleFonts.lato(
                        fontSize: 16,fontWeight: FontWeight.w500,
                        color: kSecondaryColor),),
                  ),

                ),
              ],
            ),
          ),
        ),
      ));
  }
}
