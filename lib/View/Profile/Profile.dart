import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/View/Booking/Bookings_screen.dart';
import 'package:panditapp/View/Earning/Earnings.dart';
import 'package:panditapp/View/Profile/components/Edit_Details_Screen.dart';
import 'package:panditapp/View/Profile/components/Settinng_Screen.dart';
import 'package:panditapp/View/Profile/components/id_card.dart';
import 'package:panditapp/View/login_flow/Phone_Number.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Consts/color1.dart';
import '../../consts/image_const.dart';

import '../../Consts/color1.dart';
import '../../view_model/Pandit_Bank_List_VM.dart';
import '../../view_model/Service_VM.dart';
import 'components/Bank/Bank Account Details.dart';
import 'components/Bank/Personal_Bank_Details.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  var ht, wt;

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 48,
              color: kPrimaryColor,
              child: Center(
                  child: Text(
                "My Profile",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600, fontSize: 20, color: white),
              )),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CircleAvatar(
                        radius: 50.0,
                        child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwihVNuLOzSu0timFcUZ0z1t23FrAEJ2EPghv3aKtvitpJlZ1wBmUPwXmb2GEDgSdnqeA&usqp=CAU"),
                      ),
                    ),
                    Text(
                      "Thunder",
                      style: GoogleFonts.lato(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: () {
                          ServiceVM serviceVM = Provider.of<ServiceVM>(context,listen: false);
                          serviceVM.serviceAPIcall();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Edit_Details_Screen()));
                        },
                        child: Container(
                          width: 119,
                          height: 30,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Edit Details",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: white),
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: white, size: 15.0)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Id_card_Screen()));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 10),
                        child: Container(
                          width: double.infinity,
                          height: 64,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 1, color: kSecondaryColor),
                            boxShadow: [
                              BoxShadow(
                                  color: kSecondaryColor,
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(-1, 1))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(ImageConst().IDCARD),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Vaikunth ID Card",
                                          style: GoogleFonts.lato(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: h1Color),
                                        ),
                                        Text(
                                          "View your Vaikunth ID card",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: kSecondaryColor),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Image.asset(ImageConst().ARROW),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: GestureDetector(
                        onTap: () {
                          /*Pandit_Bank_List_VM panditbanklist= Provider.of<Pandit_Bank_List_VM>(context,listen: false);
                          panditbanklist.panditbankListAPIcall();*/

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Persional_Bank_Details()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 64,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 1, color: kSecondaryColor),
                            boxShadow: [
                              BoxShadow(
                                  color: kSecondaryColor,
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(-1, 1))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  //
                                  children: [
                                    Image.asset(ImageConst().BANK),
                                    SizedBox(
                                      width: 33,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Hero(
                                            tag: "_text",
                                            child: Text(
                                              "Bank Account Details",
                                              style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: h1Color),
                                            )),
                                        Text(
                                          "Manage your bank account details",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: kSecondaryColor),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Image.asset(ImageConst().ARROW),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bookings_Screen()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 64,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 1, color: kSecondaryColor),
                            boxShadow: [
                              BoxShadow(
                                  color: kSecondaryColor,
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(-1, 1))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(ImageConst().ORDER),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "My Bookings",
                                          style: GoogleFonts.lato(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: h1Color),
                                        ),
                                        Text(
                                          "Track all your orders here",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: kSecondaryColor),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Image.asset(ImageConst().ARROW),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Earnings_Screen()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 64,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 1, color: kSecondaryColor),
                            boxShadow: [
                              BoxShadow(
                                  color: kSecondaryColor,
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(-1, 1))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(ImageConst().RUPSS),
                                    SizedBox(
                                      width: 33,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "My earnings",
                                          style: GoogleFonts.lato(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: h1Color),
                                        ),
                                        Text(
                                          "Track all your orders here",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: kSecondaryColor),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Image.asset(ImageConst().ARROW),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Setting_Screen()));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 64,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 1, color: kSecondaryColor),
                            boxShadow: [
                              BoxShadow(
                                  color: kSecondaryColor,
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(-1, 1))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(ImageConst().SETTING),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Settings",
                                          style: GoogleFonts.lato(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: h1Color),
                                        ),
                                        Text(
                                          "Access app settings here",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: kSecondaryColor),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Image.asset(ImageConst().ARROW),
                                // Icon(Icons.arrow_forward)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 15),
                      child: GestureDetector(
                        onTap: () {
                          _showlogoutDigalog();
                        },
                        child: Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 1, color: Colors.red),
                              boxShadow: [
                                BoxShadow(
                                    color: kSecondaryColor,
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: Offset(-1, 1))
                              ],
                            ),
                            child: Center(
                                child: Text(
                              "Logout",
                              style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red),
                            ))),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _showlogoutDigalog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Image.asset(
                "assets/images/logout.png",
                width: 62,
                height: 58,
              ),
              content: Text(
                "Logout from the app",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600, fontSize: 18, color: h1Color),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 100,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(width: 1, color: kSecondaryColor),
                        ),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: kSecondaryColor),
                            ))),
                    Container(
                        width: 100,
                        height: 58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: kPrimaryColor),
                        child: CupertinoButton(
                            child: Text("LogOut"),
                            onPressed: () async {
                              {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.remove('name');
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext ctx) =>
                                            PhoneNumber_Screen()),
                                    (route) => false);
                              }
                            }))
                  ],
                )
              ],
            ));
  }
}
