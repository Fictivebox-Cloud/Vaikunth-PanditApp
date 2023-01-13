import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Consts/themescolor.dart';
import '../route_app/page_navigeter_name_route.dart';
import '../view_model/Profile/Personal_Detail_View_Model.dart';

class AppBarcomon extends StatefulWidget {
  const AppBarcomon({Key? key}) : super(key: key);

  @override
  State<AppBarcomon> createState() => _AppBarcomonState();
}

class _AppBarcomonState extends State<AppBarcomon> {
  late PersonalDetailViewModel? personaldetailviewmodel;


  @override
  void initState() {
    personaldetailviewmodel = Provider.of<PersonalDetailViewModel>(context, listen: false);
    personaldetailviewmodel?.getpersonalDetailApiCall();
  }
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10,bottom: 15),
        child:
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.Profile_Screen);
              },
              child: CircleAvatar(
                radius: 20,
                backgroundImage:
                NetworkImage(personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditImage.toString() ?? "",),
                backgroundColor: Colors.transparent,
              ),
            ),

            SizedBox(width: 8,),
            Text(
              personaldetailviewmodel?.presonalDetailModel
                  ?.response?.panditDetails?.panditFirstName ?? "",
              style: GoogleFonts.lato(fontSize: 16,fontWeight:FontWeight.w800,),),

            // SizedBox(
            //   height: 31,
            //   width: 120,
            //   child: LiteRollingSwitch(
            //     textOn: "Online",
            //     value: true,
            //     textOff: "Ofline",
            //     colorOn: btn,
            //     colorOff: p1Color,
            //     textSize: 16,
            //     onChanged: (val) {
            //       _online_ofline_view_model =
            //           Provider.of<OnlineOflineViewModel>(context,
            //               listen: false);
            //       _online_ofline_view_model.getonlineofline(
            //           userStatus: val ? "1" : "0");
            //     },
            //   ),
            // ),

            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.Notifications_screen);
              },
              child: const Icon(Icons.notifications,color: kPrimaryColor,),
            )
          ],
        ),
      );
  }
}
