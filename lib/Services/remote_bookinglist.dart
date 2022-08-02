import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:panditapp/model/City_Model.dart';
import 'package:panditapp/model/online_offline.dart';

import '../model/Acept_Booking_Model.dart';
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

  bool _apiCall = true;
  bool get apiCall => _apiCall;

 //Accept Booking Api Methode

  bool _acceptListStatus = false;
  bool get acceptListStatus => _acceptListStatus;

  bool _dataaccpetStatus = false;
  bool get accpetdataStatus => _dataaccpetStatus;

  AcceptBookingModel _acceptBookingModel = AcceptBookingModel();
  AcceptBookingModel get acceptBookingModel => _acceptBookingModel;


  OnlineAndOfflineModel _onlineAndOfflineModel = OnlineAndOfflineModel();
  OnlineAndOfflineModel get onlineAndOfflineModel => _onlineAndOfflineModel;





  Future<BookModel?> getEventListData() async {

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


  Future  fachingApiOnlineAndOffline()   async {
    try {
      String username = 'am9uZUAyOTc4';
      String password = 'RklUTkVTU0AjMTIz';
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$username:$password'));
      var url = Uri.parse("https://vaikunth.fictivebox.com/api/onlinestatus");

      var apiResponse = await http.post(url, body: {
        "pandit_id": "8",

        "status": "true"
      }, headers: <String, String>{'authorization': basicAuth},
      );
      if (apiResponse.statusCode == 200) {
        print(apiResponse.body);


        if (jsonDecode(apiResponse.body)['success']) {
          _onlineAndOfflineModel = OnlineAndOfflineModel.fromJson(jsonDecode(apiResponse.body));

          _eventListStatus = false;
          _dataStatus = true;

          notifyListeners();
        } else {
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
      // TODO
      _dataStatus = false;
      _eventListStatus = false;
      notifyListeners();

    }
  }



  Future fachingApiAcceptBooking() async{

    _apiCall = true;
    notifyListeners();
    try {
      String username = 'am9uZUAyOTc4';
      String password = 'RklUTkVTU0AjMTIz';
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$username:$password'));
      var url = Uri.parse("https://vaikunth.fictivebox.com/api/acceptbooking");

      var apiResponse = await http.post(url, body: {
        "pandit_id": "8",
        "booking_id": "604"
      }, headers: <String, String>{'authorization': basicAuth},
      );

      if (apiResponse.statusCode == 200) {
        print("Vikrant");

        if (jsonDecode(apiResponse.body)['success']) {

          _acceptBookingModel = AcceptBookingModel.fromJson(jsonDecode(apiResponse.body));
          _acceptListStatus = false;
          _dataaccpetStatus = true;

          notifyListeners();
        } else {

          _dataaccpetStatus = false;
          _acceptListStatus = false;
          notifyListeners();
        }
      } else {
        _dataaccpetStatus = false;
        _acceptListStatus = false;
        notifyListeners();
      }
    } on Exception catch (e) {


      notifyListeners();
      // TODO

      _dataaccpetStatus = false;

      _acceptListStatus = false;
      notifyListeners();
    }
  }

  void apiCallStatus(bool data) {
    _apiCall = data;
    notifyListeners();
  }



}

