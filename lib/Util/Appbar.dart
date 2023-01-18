import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/consts/image_const.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../consts/themescolor.dart';
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
      Consumer<PersonalDetailViewModel>(
        builder: (_, provider, __) => Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10,bottom: 15),
          child:
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.Profile_Screen);
                },
                child: CircularPercentIndicator(
                  radius: 22.0,
                  lineWidth: 1.0,
                  percent: personaldetailviewmodel!.loading ? 0.0 : provider.presonalDetailModel == null ? 0.0 : ((personaldetailviewmodel?.presonalDetailModel?.response?.percentage)! / 100),
                  center:
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(100),
                  //   child: CachedNetworkImage(
                  //     imageUrl: personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditImage.toString() ?? "",
                  //     placeholder: (context, url) => SvgPicture.asset(ImageConst().DEFAULT_PROFILE),
                  //     errorWidget: (context, url, error) => SvgPicture.asset(ImageConst().DEFAULT_PROFILE),
                  //   ),
                  // ),
                  CircleAvatar(
                            radius: 20,
                            foregroundImage: NetworkImage(personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditImage.toString() ?? "",),
                            backgroundImage:
                            NetworkImage(personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditImage.toString() ?? "",),
                            backgroundColor: Colors.transparent,
                    onForegroundImageError: (_, error) => SvgPicture.asset(ImageConst().DEFAULT_PROFILE),
                    onBackgroundImageError: (_, error) => SvgPicture.asset(ImageConst().DEFAULT_PROFILE),
                  ),
                  backgroundColor: GREY_COLOR,
                  progressColor: GREEN_COLOR,
                ),
                // SizedBox(
                //   width: 30,
                //   height: 40,
                //   child: Stack(
                //     children: [
                //       Container(
                //         width: 30,
                //         height: 30,
                //         color: Colors.white,
                //         child: CircularPercentIndicator(
                //           animationDuration: 200,
                //           animateFromLastPercent: true,
                //           arcType: ArcType.FULL,
                //           arcBackgroundColor: Colors.black12,
                //           backgroundColor: Colors.white,
                //           progressColor: Colors.green,
                //           percent: 1.0,
                //           animation: true,
                //           radius: 20.0,
                //           lineWidth: 2.0,
                //           circularStrokeCap: CircularStrokeCap.round,
                //         ),
                //       ),
                //       ClipRRect(
                //         child: Image.network(
                //           personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditImage.toString() ?? "",
                //         width: 28,
                //         height: 28,),
                //       ),
                //       // CircleAvatar(
                //       //   radius: 20,
                //       //   backgroundImage:
                //       //   NetworkImage(personaldetailviewmodel?.presonalDetailModel?.response?.panditDetails?.panditImage.toString() ?? "",),
                //       //   backgroundColor: Colors.transparent,
                //       // ),
                //     ],
                //   ),
                // ),
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
        ),
      );
  }
}
