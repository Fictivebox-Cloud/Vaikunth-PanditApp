import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:panditapp/Viwe/Home/Pages/BookingList.dart';
import 'package:panditapp/view_model/booking_request_view_model.dart';
import 'package:provider/provider.dart';

import '../../../Consts/colors.dart';

class Home_page_Screen extends StatelessWidget {
  Home_page_Screen({Key? key}) : super(key: key);

  var ht, wt;

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    Booking_Request_View_Model booking_request_view_model =
        context.watch<Booking_Request_View_Model>();


    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: _ui(booking_request_view_model),
      ),
    );
  }

  _ui(Booking_Request_View_Model booking_request_view_model) {
    if (booking_request_view_model.loading) {
      return Center(child: CircularProgressIndicator(color: kPrimaryColor,));
    } else if (booking_request_view_model.userError != null) {
      return Center(
        child: Text(booking_request_view_model.userError!.message.toString() ??
            "Error"),
      );
    }
    //return Text("GGG");
     return _listDesign(booking_request_view_model);
  }

  _listDesign(Booking_Request_View_Model booking_request_view_model) {
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
                  // Navigator.push(context, MaterialPageRoute(
                  //     builder: (context) => const Profile_Screen()));
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
                  colorOn: colorbtn,
                  colorOff: p1Color,
                  textSize: 16,
                  onChanged: (bool position) {
                    print("The Vikrant $position");
                  },
                ),
              ),
              InkWell(
                onTap: () {

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
              "assets/images/vector.png",
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Welcome to Vaikunth",
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
            'Bookings Request',
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w600, fontSize: 18, color: h1Color),
          ),
        ),
        Expanded(child: SingleChildScrollView(child: BookingListTitl(booking_request_view_model: booking_request_view_model)))

      ],
    );
  }
}
