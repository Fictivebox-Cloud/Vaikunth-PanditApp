import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/BookingModel.dart';

class RemoteBookinglist with ChangeNotifier {

  bool _eventListStatus = false;
  bool get eventListStatus => _eventListStatus;

  bool _dataStatus = false;
  bool get dataStatus => _dataStatus;

  BookModel _bookingModel = BookModel();
  BookModel get bookingModel => _bookingModel;

  int _index = 0;
  int get index => _index;

  Future getEventListData() async {
    try {
      _eventListStatus = true;
      notifyListeners();
      String username = 'am9uZUAyOTc4';
      String password = 'RklUTkVTU0AjMTIz';
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$username:$password'));
      var url = Uri.parse("https://vaikunth.fictivebox.com/api/getbookinglist");
      var apiResponse = await http.post(url, body: {
        "pandit_id": "8",
      }, headers: <String, String>{'authorization': basicAuth},
      );

      if (apiResponse.statusCode == 200) {

        if (jsonDecode(apiResponse.body)['success']) {

          _bookingModel = BookModel.fromJson(jsonDecode(apiResponse.body));
          _eventListStatus = false;
          _dataStatus = true;
          notifyListeners();
        } else {
          CircularProgressIndicator(color: Color(0xFFFF7D33),);
          _dataStatus = false;
          _eventListStatus = false;
          notifyListeners();
        }
      } else {
        _dataStatus = false;
        _eventListStatus = false;
        notifyListeners();
      }
    } on Exception catch (e) {
      _dataStatus = false;
      _eventListStatus = false;
      notifyListeners();
    }
  }


  //fachingApi call in Accept booking

  Future acceptBooking() async{

    String username = 'am9uZUAyOTc4';
    String password = 'RklUTkVTU0AjMTIz';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    var url = Uri.parse("https://vaikunth.fictivebox.com/api/acceptbooking");
    var apiResponsee = await http.post(url, body: {
      "pandit_id": "43",

      "booking_id": "598",
    }, headers: <String, String>{'authorization': basicAuth},
    );

    if(apiResponsee.statusCode==200){


    }

}


}