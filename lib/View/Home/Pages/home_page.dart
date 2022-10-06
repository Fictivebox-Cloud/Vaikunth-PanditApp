import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:panditapp/View/Home/Pages/BookingList.dart';
import 'package:panditapp/view_model/home_tab/Online_Ofline_view_model.dart';
import 'package:panditapp/view_model/home_tab/booking_request_view_model.dart';
import 'package:provider/provider.dart';
import '../../../Consts/text_const.dart';
import '../../../consts/image_const.dart';
import '../../../consts/themescolor.dart';
import '../../../route_app/page_navigeter_name_route.dart';
class Home_page_Screen extends StatefulWidget {
  @override
  State<Home_page_Screen> createState() => _Home_page_ScreenState();
}

class _Home_page_ScreenState extends State<Home_page_Screen> {
  var ht, wt;
  late Online_Ofline_View_Model _online_ofline_view_model;
  late Booking_Request_View_Model booking_request_view_model;

  Future<void> _refresh(bool reload, BuildContext context){
     booking_request_view_model= Provider.of<Booking_Request_View_Model>(context,listen: false);
    booking_request_view_model.getbookingApiCall(reload);
    return Future.delayed(const Duration(seconds: 0));
  }

  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Booking_Request_View_Model booking_request_view_model =
        context.watch<Booking_Request_View_Model>();
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return SafeArea(
      child:  RefreshIndicator(
          onRefresh: () async{
           await _refresh(true, context);
          },
          color: kPrimaryColor,
          strokeWidth: 5,
          displacement: 0,
        child: Scaffold(
          body: _listDesign(booking_request_view_model, context)
        ),
      ),
    );
  }
  _listDesign(Booking_Request_View_Model booking_request_view_model,
      BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appBar(),
        const SizedBox(
          height: 32,
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
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
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
  Widget appBar(){
    return  Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Navigator.pushNamed(context, RouteName.Notifications_screen);
            },
            child: const Icon(Icons.notifications),
          )
        ],
      ),
    );
  }
}