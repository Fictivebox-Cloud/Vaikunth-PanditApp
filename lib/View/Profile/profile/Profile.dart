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
import '../../../Util/login_in_User.dart';
import '../../../Util/picture/image.dart';
import '../../../Widgets/circular_loader.dart';
import '../../../consts/image_const.dart';
import '../../../consts/text_const.dart';
import '../../../consts/themescolor.dart';
import '../../../view_model/Login/Service_VM.dart';
import '../../../view_model/Profile/Personal_Detail_View_Model.dart';
import '../../login_flow/Photo_Upload.dart';
import '../components/Bank/Personal_Bank_Details.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'editprofile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  var ht, wt;

  late PersonalDetailViewModel? personaldetailviewmodel;

  @override
  void initState() {
    personaldetailviewmodel = Provider.of<PersonalDetailViewModel>(context, listen: false);
    personaldetailviewmodel?.getpersonalDetailApiCall();
  }

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: Consumer<PersonalDetailViewModel>(
  builder: (context, provider, child) {


  return  personaldetailviewmodel!.loading
      ? Center(child: CircularLoader())
      :SafeArea(

        child:
        Column(
          children: [
            //bodyProfile(),
            Expanded(child: profilee()),
          ],
        ),
      );
  },
),
    );
  }

  _showlogoutDigalog() {
    return
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
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

                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 48,
                        width: double.infinity,
                        child:
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color:p1Color)
                                    )
                                )
                            ),
                            onPressed: (){
                              Navigator.of(context).pop(false);
                            },
                            child: Text(CANCEL,style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color:p1Color),
                            ),)
                        ),
                    ),
                    SizedBox(width: 16,),

                    Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: 48,
                          width: double.infinity,
                          child:
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(color:kPrimaryColor)
                                    )
                                )
                            ),
                            onPressed: ()async{
                              await LoggedInUserBloc.instance().logout(context);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext ctx) =>
                                      const PhoneNumber_Screen()),
                                      (route) => false);
                            },
                            child: Text(LOGOUT,style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color:white),
                            ),)
                      ),
                    ),


                  ],
                )
              ],
            ));
  }

  Widget profilee(){
    return Container(
      child: Column(
        children: [
          Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: colorPrimary,
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10,),bottomRight: Radius.circular(10))

              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom:35,left: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(MYPROFILE,style: GoogleFonts.lato(fontWeight: FontWeight.w800,fontSize: 18,color:white),),
                  ],
                ),
              )),

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 16,right: 16),
                child: Column(children: [
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>Editmyprofile()));                    },
                    child: Row(
                      children: [
                        Container(

                          child: ClipRRect(
                              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(64,),bottomRight: Radius.circular(64),topRight: Radius.circular(64),topLeft: Radius.circular(5)),
                              child: Image.network(personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditImage ?? "",fit: BoxFit.fill,height: 100,width: 100,)),
                        ),
                        // Image.network(personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditImage ?? "",
                        //   width: 134,
                        //   height: 134,
                        //   fit: BoxFit.cover,
                        // ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Text(
                            personaldetailviewmodel?.presonalDetailModel
                                ?.response?.panditDetails?.panditFirstName ?? "",
                        style: GoogleFonts.mukta(fontSize:20,fontWeight: FontWeight.w400 ),),
                          InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>Editmyprofile()));
                              },
                              child: Text(EDITDETAILS,style: GoogleFonts.mukta(fontSize:16,fontWeight: FontWeight.w400,color: TextColor),)),

                        ],)
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 20,),
                  //My Profile
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>Editmyprofile()));
                    },
                    child: Row(children: [
                      SvgPicture.asset(IMG().PROFILE),
                      SizedBox(width: 14,),
                      Text(MYPROFILE,style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 18),),
                    ],),
                  ),
                  SizedBox(height: 20,),
                  Divider(),
                  SizedBox(height: 20,),
                  //Bank Account Details
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersionalBankDetails(
                                bank_id: '',
                              )));
                      },
                    child: Row(children: [
                      SvgPicture.asset(IMG().SETTING),
                      SizedBox(width: 14,),
                      Text(BANK_ACCOUNT_DETAILS,style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 18),),
                    ],),
                  ),
                  SizedBox(height: 20,),
                  Divider(),
                  SizedBox(height: 20,),
                  //My Booking
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BookingsScreen()));
                    },
                    child: Row(children: [
                      SvgPicture.asset(IMG().MYBOOKING),
                      SizedBox(width: 14,),
                      Text(MYBOOKING,style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 18),),
                    ],),
                  ),
                  SizedBox(height: 20,),

                  Divider(),
                  SizedBox(height: 20,),
                  //My Earning
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EarningsScreen()));
                    },
                    child: Row(children: [
                      SvgPicture.asset(IMG().MYEARNING),
                      SizedBox(width: 14,),
                      Text(MY_EARNINGS,style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 18),),
                    ],),
                  ),

                  SizedBox(height: 20,),
                  Divider(),
                  SizedBox(height: 20,),
                  //Setting
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingScreen()));
                    },
                    child: Row(children: [
                      SvgPicture.asset(IMG().SETTING),
                      SizedBox(width: 14,),
                      Text(SETTING,style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 18),),
                    ],),
                  ),

                  SizedBox(height: 20,),

                  Divider(),
                  SizedBox(height: 20,),
                  //Log out
                  InkWell(
                    onTap: (){
                      _showlogoutDigalog();
                    },
                    child: Row(children: [
                      SvgPicture.asset(IMG().SIGNOUT),
                      SizedBox(width: 14,),
                      Text(LOGOUT,style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 18),),
                    ],),
                  ),
                  SizedBox(height: 20,),
                  Divider(),
                  SizedBox(height: 20,),


                ],),),
            ),
          )


        ],
        //      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(64,),bottomRight: Radius.circular(64),topRight: Radius.circular(64))
      ),
    );
  }

}



