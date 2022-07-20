import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Screen/Home/Home_Screen.dart';
import 'package:panditapp/Screen/Home/Pages/home_page.dart';
class Money_transferred_succesfully extends StatefulWidget {
  const Money_transferred_succesfully({Key? key}) : super(key: key);

  @override
  State<Money_transferred_succesfully> createState() => _Money_transferred_succesfullyState();
}

class _Money_transferred_succesfullyState extends State<Money_transferred_succesfully> {

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
                    color: Color(0xff6363BE)
                ),
                child: Center(child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
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
