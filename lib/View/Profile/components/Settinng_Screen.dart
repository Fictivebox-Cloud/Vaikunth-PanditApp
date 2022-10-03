import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/consts/image_const.dart';
import 'package:panditapp/consts/text_const.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../consts/themescolor.dart';
import '../../../view_model/Profile/Help_Support_Details_VM.dart';
import 'Help&Support.dart';

class Setting_Screen extends StatefulWidget {
  const Setting_Screen({Key? key}) : super(key: key);

  @override
  State<Setting_Screen> createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  var ht, wt;


  Widget privacyPolicyDesign(){
    return GestureDetector(
      onTap: () {
        _privacypolicyURL(context);
      },
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: kSecondaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(ImageConst().PROFILE_PRIVACY_IMAGES),
                  Text(
                    PRIVACYPOLICY,
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: h1Color),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }


  Widget termsConditionsDesign(){
    return GestureDetector(
      onTap: () {
        _launchURL(context);
      },
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: kSecondaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                      ImageConst().TERMS_AND_CONDITIONS_IMAGES),
                  Text(
                    TERMS_CONDITIONS,
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: h1Color),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }

  Widget helpSupportDesign(){
    return GestureDetector(
      onTap: () {
        HelpSupportDetails_VM panditbanklist =
        Provider.of<HelpSupportDetails_VM>(context,
            listen: false);
        panditbanklist.HelpSupportDetailsAPIcall();

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Help_Support_Screen()));
      },
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: kSecondaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(ImageConst().HELP_IMAGES),
                  Text(
                    HELPSUPPORT,
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: h1Color),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(SETTING),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: Column(
              children: [
                privacyPolicyDesign(),
                SizedBox(
                  height: 16,
                ),
                termsConditionsDesign(),
                SizedBox(
                  height: 16,
                ),
                helpSupportDesign(),

              ],
            ),
          ),
        ),
      ),
    );
  }



  void _launchURL(BuildContext context) async {
    try {
      launch('https://vaikunth.fictivebox.com/t&c',
       /*   customTabsOption: CustomTabsOption(
            toolbarColor: Theme.of(context).primaryColor,
          )*/
      );
    }
    catch(e) {
      debugPrint(e.toString());
    }
  }
  void _privacypolicyURL(BuildContext context) async {
    try {
      launch('https://vaikunth.fictivebox.com/privacypolicy',
        /*   customTabsOption: CustomTabsOption(
            toolbarColor: Theme.of(context).primaryColor,
          )*/
      );
    }
    catch(e) {
      debugPrint(e.toString());
    }
  }
}
