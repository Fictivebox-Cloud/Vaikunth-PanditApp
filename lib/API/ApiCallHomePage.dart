import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:panditapp/Services/remote_bookinglist.dart';

import '../model/bookingModel.dart';


class ApiCallHomePage extends GetxController {
  var isLoading =true.obs;

var bookingList = <BookingModel>[].obs;
 @override
 void onInit() {
    // TODO: implement onInit
   fetchBooking();
    super.onInit();
  }

     void fetchBooking() async{
   isLoading(true);
    try {
      var bookingr=   await RemoteBookinglist.fetchBooking();

      if(bookingr != null){
        bookingList.value= bookingr as List<BookingModel>;
      }
    } on Exception catch (e) {
      // TODO
      isLoading(false);
    }

     }


}