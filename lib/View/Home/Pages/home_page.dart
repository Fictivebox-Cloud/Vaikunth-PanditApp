import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:panditapp/View/Home/Pages/BookingList.dart';
import 'package:panditapp/view_model/home_tab/Online_Ofline_view_model.dart';
import 'package:panditapp/view_model/home_tab/booking_request_view_model.dart';
import 'package:provider/provider.dart';
import '../../../consts/text_const.dart';
import '../../../Util/Appbar.dart';
import '../../../Util/TotalEarningGrapgComman.dart';
import '../../../consts/image_const.dart';
import '../../../consts/themescolor.dart';
import '../../../route_app/page_navigeter_name_route.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  var ht, wt;
  late OnlineOflineViewModel _online_ofline_view_model;
  late BookingRequestViewModel booking_request_view_model;

  Future<void> _refresh(bool reload, BuildContext context){
     booking_request_view_model= Provider.of<BookingRequestViewModel>(context,listen: false);
    booking_request_view_model.getbookingApiCall(reload);
    return Future.delayed(const Duration(seconds: 0));
  }

  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    BookingRequestViewModel booking_request_view_model =
        context.watch<BookingRequestViewModel>();
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
  _listDesign(BookingRequestViewModel booking_request_view_model,
      BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //appBar(),
          AppBarcomon(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16,top: 15),
              child: Column(
                children: [
                  TotalEarningGraph(),
                  SizedBox(height: 30,),

                ],
              ),
            ),
          ),

          Expanded(
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(BOOKINGS_REQUEST, style: GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 18, color: h1Color),),
                      SizedBox(height: 9,),
                      Container(
                          width: wt * 0.7,
                          alignment: Alignment.center,
                          child: Text(Home_Screen_Line, textAlign: TextAlign.center, style: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 16, color: h1Color))),
                      BookingListTitl(booking_request_view_model),
                    ],
                  )))
        ],
      ),
    );
  }


}