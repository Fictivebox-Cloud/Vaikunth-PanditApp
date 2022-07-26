import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Accept_Booking_Api extends ChangeNotifier{

  Future fachingApiAcceptBooking() async{


    try {
      String username = 'am9uZUAyOTc4';
      String password = 'RklUTkVTU0AjMTIz';
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$username:$password'));
      var url = Uri.parse("https://vaikunth.fictivebox.com/api/getcitylist");

      var apiResponse = await http.post(url, body: {
        "pandit_id": "8",
      }, headers: <String, String>{'authorization': basicAuth},
      );
     if(apiResponse.statusCode==200){
       print("Vikrant$apiResponse");
     }



    } on Exception catch (e) {


      notifyListeners();
      // TODO
    }
  }


}