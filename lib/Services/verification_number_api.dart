import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:panditapp/View/Home/Home_Screen.dart';
import 'package:panditapp/View/login_flow/Name_Screen.dart';
import 'package:panditapp/model/Verification_Model.dart';


class Verification_Number_Api extends ChangeNotifier{
  String? mobile;


  Verification_Number_Api({Key? key,this.mobile});

  bool _eventListStatus = false;
  bool get eventListStatus => _eventListStatus;

  bool _dataStatus = false;
  bool get dataStatus => _dataStatus;

  VerificationNumberModel _verifyModel = VerificationNumberModel();
  VerificationNumberModel get verificationNumberModel=>_verifyModel;
  //AcceptBookingModel _acceptBookingModel = AcceptBookingModel();
  //AcceptBookingModel get acceptBookingModel => _acceptBookingModel;
  //int _index = 0;
  //int get index => _index;

  Future fachingApiVerificationnumber(String phoneNumber) async{



    try {

      String username = 'am9uZUAyOTc4';
      String password = 'RklUTkVTU0AjMTIz';

      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$username:$password'));
      var url = Uri.parse("https://vaikunth.fictivebox.com/api/verifynumberexist");

      var apiResponse = await http.post(url,
        body: {

            "pandit_mobile":phoneNumber


        },

        headers: <String, String>{'authorization': basicAuth},
      );
          print("Verified Number:$mobile");

        if (apiResponse.statusCode == 200) {

        print("Govind: ${apiResponse.body}");

        if (jsonDecode(apiResponse.body)['success']) {

          //_acceptBookingModel = AcceptBookingModel.fromJson(jsonDecode(apiResponse.body));
          _verifyModel= VerificationNumberModel.fromJson(jsonDecode(apiResponse.body));
          _eventListStatus = false;
          _dataStatus = true;
         return _verifyModel;

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