import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Consts/themescolor.dart';
import '../route_app/page_navigeter_name_route.dart';

class AppBarcomon extends StatefulWidget {
  const AppBarcomon({Key? key}) : super(key: key);

  @override
  State<AppBarcomon> createState() => _AppBarcomonState();
}

class _AppBarcomonState extends State<AppBarcomon> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body:
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
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80'),
                backgroundColor: Colors.transparent,
              ),
            ),

            SizedBox(width: 8,),
            Text("Govind Kumar",style: GoogleFonts.lato(fontSize: 16,fontWeight:FontWeight.w800,),),

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
      )
    ));
  }
}
/*
Widget appBar(){
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
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80'),
            backgroundColor: Colors.transparent,
          ),
        ),

        SizedBox(width: 8,),
        Text("Govind Kumar",style: GoogleFonts.lato(fontSize: 16,fontWeight:FontWeight.w800,),),

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
}*/
