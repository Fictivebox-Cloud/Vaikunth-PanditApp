import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Consts/text_const.dart';
import '../../../consts/themescolor.dart';


class Life_Time_Puja extends StatefulWidget {
  const Life_Time_Puja({Key? key}) : super(key: key);

  @override
  State<Life_Time_Puja> createState() => _Life_Time_PujaState();
}

class _Life_Time_PujaState extends State<Life_Time_Puja> {
  var ht, wt;

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          LIFE_TIME_PUJA,
          style: GoogleFonts.lato(
              fontSize: 18, fontWeight: FontWeight.w600, color: white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 23),
        child: ListView.builder(
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
              child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: kSecondaryColor)),
                  child: Column(
                    children: [
                      Text(
                        "Arvind Singh",
                        style: GoogleFonts.lato(
                            color: kPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: kPrimaryColor,
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Text(
                                "Mon 05/Oct/2021",
                                style: GoogleFonts.lato(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Text(
                            TOTAL_EARNING + " ₹568",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  )),
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
