import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:panditapp/model/City_Model.dart';
import 'package:panditapp/model/Completd_Booking_Model.dart';

import '../model/BookingModel.dart';




class Completed_Booking_Api with ChangeNotifier {

  bool _compledListStatus = false;
  bool get compledListStatus => _compledListStatus;

  bool _dataStatus = false;
  bool get dataStatus => _dataStatus;

  CompledBookingModel _compledBookingModel = CompledBookingModel();
  CompledBookingModel get compledBookingModel => _compledBookingModel;
  int _index = 0;
  int get index => _index;




  Future completedBookingData() async {
    try {

      _compledListStatus = true;
      notifyListeners();


      String username = 'am9uZUAyOTc4';
      String password = 'RklUTkVTU0AjMTIz';
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$username:$password'));
      var url = Uri.parse("https://vaikunth.fictivebox.com/api/getcompbookinglist");

      var apiResponse = await http.post(url, body: {
        "pandit_id": "8",
      }, headers: <String, String>{'authorization': basicAuth},
      );


      if (apiResponse.statusCode == 200) {

        if (jsonDecode(apiResponse.body)['success']) {

          _compledBookingModel = CompledBookingModel.fromJson(jsonDecode(apiResponse.body));
          _compledListStatus = false;
          _dataStatus = true;

          notifyListeners();
        } else {

          _dataStatus = false;
          _compledListStatus = false;
          notifyListeners();
        }
      } else {

        _dataStatus = false;
        _compledListStatus = false;
        notifyListeners();

      }
    } on Exception catch (e) {
      _dataStatus = false;

      _compledListStatus = false;
      notifyListeners();
    }

  }






}

