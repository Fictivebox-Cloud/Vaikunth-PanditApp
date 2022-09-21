import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:panditapp/View/Home/Pages/BookingList.dart';
import 'package:panditapp/View/Home/Pages/Notifications_screen.dart';
import 'package:panditapp/View/Profile/Profile.dart';
import 'package:panditapp/model/Booking%20Model/BookingModel.dart';
import 'package:panditapp/view_model/home_tab/Online_Ofline_view_model.dart';
import 'package:panditapp/view_model/home_tab/booking_request_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Consts/text_const.dart';
import '../../../Widgets/OnlineAndSwitch.dart';
import '../../../consts/color1.dart';
import '../../../consts/image_const.dart';
import '../../../view_model/Service_VM.dart';

class Home_page_Screen extends StatelessWidget {
  var ht, wt;
  bool _isLoading = true;
  late Online_Ofline_View_Model _online_ofline_view_model;

  @override
  Widget build(BuildContext context) {
    Booking_Request_View_Model booking_request_view_model =
        context.watch<Booking_Request_View_Model>();
    ServiceVM serviceVM = Provider.of<ServiceVM>(context, listen: false);
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: _ui(booking_request_view_model, context),
      ),
    );
  }

  _ui(Booking_Request_View_Model booking_request_view_model,
      BuildContext context) {
    if (booking_request_view_model.loading) {
      return Center(
          child: CircularProgressIndicator(
        color: kPrimaryColor,
      ));
    } else if (booking_request_view_model.userError != null) {
      return Center(
        child: Text(booking_request_view_model.userError!.message!.toString() ??
            "Error"),
      );
    }
    //return Text("GGG");
    return _listDesign(booking_request_view_model, context);
  }

  _listDesign(Booking_Request_View_Model booking_request_view_model,
      BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Profile_Screen()));
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(
                height: 31,
                width: 120,
                child: LiteRollingSwitch(
                  textOn: "Online",
                  value: true,
                  textOff: "Ofline",
                  colorOn: btn,
                  colorOff: p1Color,
                  textSize: 16,
                  onChanged: (val) {
                    _online_ofline_view_model =
                        Provider.of<Online_Ofline_View_Model>(context,
                            listen: false);
                    _online_ofline_view_model.getonlineofline(
                        userStatus: val ? "1" : "0");
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Notifications_screen()));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notifications_screen(),
                    ),
                  );
                },
                child: const Icon(Icons.notifications),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConst().VECTOR,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              WELCOME_TO_VAIKUNTH,
              style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: kPrimaryColor),
            )
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Text(
            BOOKINGS_REQUEST,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w600, fontSize: 18, color: h1Color),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
                child: BookingListTitl(booking_request_view_model)))
      ],
    );
  }
}
