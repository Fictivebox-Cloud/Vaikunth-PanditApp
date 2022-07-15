import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Life_Time_Puja extends StatefulWidget {
  const Life_Time_Puja({Key? key}) : super(key: key);

  @override
  State<Life_Time_Puja> createState() => _Life_Time_PujaState();
}

class _Life_Time_PujaState extends State<Life_Time_Puja> {
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
    appBar: AppBar(
      title: Text("Life Time Puja’s",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,color: white),),
    ),

    body: ListView.builder(itemBuilder: (context , int index){

      return Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 32),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: kSecondaryColor
            )
          ),


          child:  ListTile(
            leading: Icon(Icons.calendar_month,color: kPrimaryColor,),
            title: Text("Arvind Singh",style: GoogleFonts.lato(color: kPrimaryColor,
            fontSize: 14,fontWeight: FontWeight.w600),),
            subtitle: Text("Mon 05/Oct/2021",style: GoogleFonts.lato(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w600),),
            trailing: Text("Total Earnings: ₹568",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 12),),

          ),
        ),
      );

    },
    itemCount: 20,
    ),


  );


}}
