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
import '../../Util/login_in_User.dart';
import '../../consts/image_const.dart';
import '../../consts/text_const.dart';
import '../../consts/themescolor.dart';
import '../../view_model/Login/Service_VM.dart';
import 'components/Bank/Personal_Bank_Details.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  var ht, wt;
  Widget bodyProfile(){
    return Expanded(
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
                  ServiceVM serviceVM =
                  Provider.of<ServiceVM>(context, listen: false);
                  serviceVM.serviceAPIcall();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditDetailsScreen()));
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
                          EDITDETAILS,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: white),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            color: white, size: 15.0)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            vaikunthIdCardContainer(),
            bankAccountDetailsContainer(),
            myBookingContainer(),
            myEarningsContainer(),
            settingdContainer(),
            logoutContainer(),
            const SizedBox(
              height: 17,
            )
          ],
        ),
      ),
    );
  }
 Widget vaikunthIdCardContainer(){
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const IdCardScreen()));
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
              const BoxShadow(
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
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          VAIKUNTHIDCARD,
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: h1Color),
                        ),
                        Text(
                          VIEWYOURVAIKUNTHIDCARD,
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
    );
 }
 Widget bankAccountDetailsContainer(){
    return Padding(
      padding:
      const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PersionalBankDetails(
                    bank_id: '',
                  )));
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
              const BoxShadow(
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
                    const SizedBox(
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
                              BANK_ACCOUNT_DETAILS,
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: h1Color),
                            )),
                        Text(
                          MANAGEBANK_ACCOUNT_DETAILS,
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
    );
 }
 Widget myBookingContainer(){
    return Padding(
      padding:
      const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BookingsScreen()));
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
              const BoxShadow(
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
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          MYBOOKING,
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: h1Color),
                        ),
                        Text(
                          TRACK_ALL_YOUR_ORDERS_HERE,
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
    );
 }
 Widget myEarningsContainer(){
    return Padding(
      padding:
      const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EarningsScreen()));
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
              const BoxShadow(
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
                    const SizedBox(
                      width: 33,
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          MY_EARNINGS,
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: h1Color),
                        ),
                        Text(
                          TRACK_ALL_YOUR_ORDERS_HERE,
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
    );
 }
 Widget settingdContainer(){
    return Padding(
      padding:
      const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SettingScreen()));
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
              const BoxShadow(
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
                    const SizedBox(
                      width: 21,
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          SETTING,
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: h1Color),
                        ),
                        Text(
                          ACCESS_APP_SETTING_HERE,
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
    );
 }
 Widget logoutContainer(){
    return Padding(
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
                const BoxShadow(
                    color: kSecondaryColor,
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(-1, 1))
              ],
            ),
            child: Center(
                child: Text(
                  LOGOUT,
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: logoutclr),
                ))),
      ),
    );
 }

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
                MYPROFILE,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600, fontSize: 20, color: white),
              )),
            ),
            bodyProfile()
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
                ImageConst().LOGOUT_IMAGES,
                width: 62,
                height: 58,
              ),
              content: Text(
                LOGOUTFROMTHEAPP,
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
                              CANCEL,
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
                            child: const Text(LOGOUT),
                            onPressed: () async {
                              {
                                await LoggedInUserBloc.instance().logout(context);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext ctx) =>
                                            const PhoneNumberScreen()),
                                    (route) => false);
                              }
                            }))
                  ],
                )
              ],
            ));
  }
}
