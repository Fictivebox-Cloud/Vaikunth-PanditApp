import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Verification_Number_Api extends ChangeNotifier{


  bool _eventListStatus = false;
  bool get eventListStatus => _eventListStatus;

  bool _dataStatus = false;
  bool get dataStatus => _dataStatus;

  //AcceptBookingModel _acceptBookingModel = AcceptBookingModel();
  //AcceptBookingModel get acceptBookingModel => _acceptBookingModel;
  //int _index = 0;
  //int get index => _index;

  Future fachingApiVerificationnumber() async{

    try {
      String username = 'am9uZUAyOTc4';
      String password = 'RklUTkVTU0AjMTIz';
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$username:$password'));
      var url = Uri.parse("https://vaikunth.fictivebox.com/api/verifynumberexist");

      var apiResponse = await http.post(url,
        body: {

            "pandit_mobile": "9501883783"

        },
        headers: <String, String>{'authorization': basicAuth},
      );

      if (apiResponse.statusCode == 200) {
        print("Govinddddddddd::${apiResponse.body}");

        if (jsonDecode(apiResponse.body)['success']) {

          //_acceptBookingModel = AcceptBookingModel.fromJson(jsonDecode(apiResponse.body));
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


      notifyListeners();
      // TODO

      _dataStatus = false;

      _eventListStatus = false;
      notifyListeners();
    }
  }


}