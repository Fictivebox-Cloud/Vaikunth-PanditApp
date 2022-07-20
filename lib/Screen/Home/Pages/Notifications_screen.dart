import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications_screen extends StatefulWidget {
  const Notifications_screen({Key? key}) : super(key: key);

  @override
  State<Notifications_screen> createState() => _Notifications_screenState();
}

class _Notifications_screenState extends State<Notifications_screen> {

  var ht,wt;
  Color kPrimaryColor = const Color(0xffFF7D33);
  Color kSecondaryColor = const Color(0xffCACACA);
  Color kScaffoldBackground = const Color(0xffFFF3E9);
  Color p1Color =  const Color(0xff6E798C);
  Color white = const Color(0xffFFFFFF);
  Color h1Color =const Color(0xff343D48);
  Color buttonColor = const Color(0xff109D03);


  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
         title: Text("Notifications"),
      ),
       backgroundColor: white ,
      body: ListView.builder(itemBuilder: (context , int index){

        return Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 32),
          child: ListTile(
            leading: Icon(Icons.notifications,color: Colors.black,),
            title: Text("There are many variations of passages of Lorem Ipsum available.",style: GoogleFonts.lato(color: h1Color,
                fontSize: 12,fontWeight: FontWeight.w400),),
            trailing: Text("Just Now",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 12,color: kSecondaryColor),),

          ),

        );

      },
        itemCount: 20,
      ),
    );
  }
}
