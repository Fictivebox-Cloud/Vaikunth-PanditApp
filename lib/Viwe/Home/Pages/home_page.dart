
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';


import 'package:panditapp/Services/Accept_Booking_Api.dart';
import 'package:panditapp/Services/remote_bookinglist.dart';
import 'package:panditapp/Viwe/Home/Pages/BookingList.dart';
import 'package:panditapp/Viwe/Home/Pages/Notifications_screen.dart';
import 'package:panditapp/Viwe/Profile/Profile.dart';
import 'package:provider/provider.dart';




class Home_page_Screen extends StatefulWidget {


  Home_page_Screen({Key? key}) : super(key: key);

  @override
  State<Home_page_Screen> createState() => _Home_page_ScreenState();
}

class _Home_page_ScreenState extends State<Home_page_Screen> {
  var ht, wt;
  Color kPrimaryColor = const Color(0xffFF7D33);
  Color kSecondaryColor = const Color(0xffCACACA);
  Color kScaffoldBackground = const Color(0xffFFF3E9);
  Color p1Color = const Color(0xff6E798C);
  Color white = const Color(0xffFFFFFF);
  Color h1Color = const Color(0xff343D48);
  Color buttonColor = const Color(0xff109D03);


  bool _isLoading =true;

  @override
  void initState() {
    RemoteBookinglist ss =  Provider.of<RemoteBookinglist>(context, listen: false);
    ss.getEventListData();

    RemoteBookinglist vv = Provider.of<RemoteBookinglist>(context,listen:  false);
    vv.fachingApiAcceptBooking();
  }

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery
        .of(context)
        .size
        .width;
    ht = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: white,
      body: Consumer<RemoteBookinglist?>(builder: (_, data, __)

       {



        return SafeArea(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Profile_Screen()));
                      },
                      child: Container(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                          NetworkImage(
                              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 31,
                      width: 120,
                      child: LiteRollingSwitch(
                        value: true,
                        textOn: "Online",
                        textOff: "Ofline",
                        colorOn: const Color(0xff109D03),
                        colorOff: const Color(0xff6E798C),

                        textSize: 16,
                        onChanged: (bool position) {
                          print("The Vikrant $position");
                        },
                      ),

                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Notifications_screen()));
                      },
                      child: const Icon(

                          Icons.notifications),
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
                  Image.asset("assets/images/vector.png",),
                  const SizedBox(width: 10,),
                  Text("Welcome to Vaikunth",
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.w800,
                        color: kPrimaryColor),)
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Text('Bookings Request',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: h1Color
                  ),
                ),
              ),

              Expanded(

                child:  ListView.builder(itemBuilder: (context, int index) {

                    return BookingListTitl(index: index,);

                  },
                    itemCount: data!.bookingModel.response!.bookinglist!.length,

                  ),

                ),

            ],
          ),
        );
      },),

    );
  }


}



//
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// class Home {
//   multipartProdecudre() async {
//
//
//     //for multipartrequest
//     var request = http.MultipartRequest('POST', Uri.parse('YOUR URL'));
//
//     //for token
//     request.headers.addAll({"Authorization": "Bearer token"});
//
//     //for image and videos and files
//
//     request.files.add(await http.MultipartFile.fromPath("key_value_from_api", "image_path/video/path"));
//
//     //for completeing the request
//     var response =await request.send();
//
//     //for getting and decoding the response into json format
//     var responsed = await http.Response.fromStream(response);
//     final responseData = json.decode(responsed.body);
//
//
//      if (response.statusCode==200) {
//         print("SUCCESS");
//         print(responseData);
//       }
//      else {
//       print("ERROR");
//     }
//   }}//




