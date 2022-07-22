
import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/bookingModel.dart';

class RemoteBookinglist {


  static var client =http.Client();

  static Future<BookingModel?> fetchBooking() async{


    String username = 'am9uZUAyOTc4';
    String password = 'RklUTkVTU0AjMTIz';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);

    var response =await  client.post(Uri.parse("https://vaikunth.fictivebox.com/api/getbookinglist"),
        headers: <String, String>{'authorization': basicAuth},
        body: {
          "pandit_id": "8"
        }

    );



    if(response.statusCode ==200){
      // var responsedata =jsonDecode(response.body);
      var jsonString =response.body;
      return bookingModelFromJson(jsonString);
    }
    else{

      Get.snackbar("Error", "Eroor while communicating with API");
    }
  }


}