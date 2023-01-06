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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appBar(),

        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16,top: 20),
            child: Column(
              children: [
                totalgraphwidget(),
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
                    Text("Lorem Ipsum is simply dummy"),
                    Text("text of the printing."),
                    BookingListTitl(booking_request_view_model),
                  ],
                )))
      ],
    );
  }
  Widget appBar(){
    return  Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Row(
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
  }
  Widget totalgraphwidget(){
    return Container(
      padding: EdgeInsets.only(left: 16,right: 16,top: 1),
      height: 168,
      //width: d,
      decoration: BoxDecoration(
          color: Color(0xFFffffff),
          boxShadow: [
            BoxShadow(
              color: Color(0xffFFD1CC),
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 8.0, //extend the shadow
              // offset: Offset(
              //   1.0, // Move to right 5  horizontally
              //   5.0, // Move to bottom 5 Vertically
              // ),
            )
          ],

        //border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
              Row(children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  //color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
             // color: Colors.blue,
              height:62 ,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Earning",style: GoogleFonts.lato(fontSize:14,fontWeight: FontWeight.w400,color:Color(0xff7C7C7C)),),
                  Spacer(),
                  Text("₹20000.00",style: GoogleFonts.lato(fontSize:24,fontWeight: FontWeight.w700),),
                ],
              ),
            ),
          ),
          //Spacer(),
          SizedBox(width: 16,),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              width: double.infinity,
              height: 62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Duty",style: GoogleFonts.lato(fontSize:14,fontWeight: FontWeight.w400,color:Color(0xff7C7C7C)),),
                  Spacer(),
                  SizedBox(
                    height: 31,
                    width: 120,
                    child: LiteRollingSwitch(
                      textOn: "Working",
                      value: true,
                      textOff: "Ofline",
                      colorOn: btn,
                      colorOff: p1Color,
                      textSize: 16,
                      onChanged: (val) {
                        _online_ofline_view_model =
                            Provider.of<OnlineOflineViewModel>(context,
                                listen: false);
                        _online_ofline_view_model.getonlineofline(
                            userStatus: val ? "1" : "0");
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],),
              Row(children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE2FFF3),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    height: 62,
                    width: double.infinity,
                    //color: Colors.red,
                    child: Column(
                      children: [
                        Text("today Earn"),
                        Text("700"),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFFD1CC),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    height: 62,
                    width: double.infinity,
                    //color: Colors.orangeAccent,
                    child: Column(
                      children: [
                        Text("Total Visits"),
                        Text("100"),

                      ],
                    ),
                  ),
                ),
              ],),



      ],),
    );
  }
}