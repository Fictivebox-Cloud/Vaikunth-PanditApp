import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Consts/image_const.dart';
import 'package:panditapp/View/Home/Home_Screen.dart';

import '../../../Consts/text_const.dart';
import '../../../consts/themescolor.dart';

class MoneyTransferredSuccesfully extends StatefulWidget {
  const MoneyTransferredSuccesfully({Key? key}) : super(key: key);

  @override
  State<MoneyTransferredSuccesfully> createState() =>
      _MoneyTransferredSuccesfullyState();
}

class _MoneyTransferredSuccesfullyState
    extends State<MoneyTransferredSuccesfully> {
  var ht, wt;

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
                      image: AssetImage(
                        ImageConst().SUCCESS_GIF
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 86,
                  ),
                  Text(
                    "₹2518.00",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        color: h1Color),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    MONEY_TRANSFER_SUCCESFULLY,
                    style: GoogleFonts.lato(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4), color: b1Color),
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text(
                          DONE,
                          style: GoogleFonts.lato(
                              fontSize: 20,
                              color: white,
                              fontWeight: FontWeight.w500),
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
