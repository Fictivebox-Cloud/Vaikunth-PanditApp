import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/View/Home/Home_Screen.dart';

import '../../../Consts/color1.dart';

class Money_transferred_succesfully extends StatefulWidget {
  const Money_transferred_succesfully({Key? key}) : super(key: key);

  @override
  State<Money_transferred_succesfully> createState() => _Money_transferred_succesfullyState();
}

class _Money_transferred_succesfullyState extends State<Money_transferred_succesfully> {
  var ht,wt;
  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Center(
                      child: Image(
                        width: 130,
                        height: 130,
                        image: AssetImage('assets/images/success.gif',),
                      ),
                    ),
                  SizedBox(height: 86,),
                  Text("₹2518.00",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 28,color: h1Color),),
                  SizedBox(height: 10,),
                  Text("Money transferred succesfully",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w500,color: kPrimaryColor),),



                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,bottom: 15),
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: b1Color
                ),
                child: Center(child: TextButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home_Screen()), (Route<dynamic> route) => false);
                    },
                    child: Text("Done",style: GoogleFonts.lato(fontSize: 20,color: white,fontWeight: FontWeight.w500),))),
              ),
            )

          ],
        ),
      ),
    );
  }
}
