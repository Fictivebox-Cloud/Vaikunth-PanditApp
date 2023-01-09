import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Widgets/circular_loader.dart';
import '../../../consts/text_const.dart';
import '../../../consts/themescolor.dart';
import '../../../view_model/Profile/Help_Support_Details_VM.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  var ht, wt;

  @override
  Widget build(BuildContext context) {
    HelpSupportDetails_VM helpSupportDetails_VM =
        context.watch<HelpSupportDetails_VM>();
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(HELPSUPPORT),
      ),
      body: helpSupportDetails_VM.loading
          ? Center(child: CircularLoader())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  FAHPCOBD,
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 68,
                              ),
                              Icon(
                                Icons.phone,
                                color: kPrimaryColor,
                              ),
                              Text(helpSupportDetails_VM
                                  .helpSupportDetailsModel!
                                  .response!
                                  .helplist![0]
                                  .helpMobile
                                  .toString()),
                              //Text("+91 7704087638"),
                              SizedBox(
                                height: 72.33,
                              ),
                              Icon(
                                Icons.mail,
                                color: kPrimaryColor,
                              ),
                              // Text("Support@vaikunth.com")
                              Text(helpSupportDetails_VM
                                  .helpSupportDetailsModel!
                                  .response!
                                  .helplist![0]
                                  .helpEmail
                                  .toString())
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launch(
                            'mailto:${helpSupportDetails_VM.helpSupportDetailsModel!.response!.helplist![0].helpEmail.toString()}');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 52,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: kSecondaryColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    SEND_EMAIL,
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: h1Color),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  color: white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      FlutterPhoneDirectCaller.callNumber(
                                          "${helpSupportDetails_VM.helpSupportDetailsModel!.response!.helplist![0].helpMobile.toString()}");
                                    },
                                    child: Text(
                                      CALL_NOW,
                                      style: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: white),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
