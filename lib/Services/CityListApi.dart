import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/City_Model.dart';

import 'package:http/http.dart' as http;

class City_List_Api extends ChangeNotifier{

  CityModel _cityModel =CityModel();
  CityModel get cityMidel => _cityModel;


  bool _cityListStatus = false;
  bool get cityListStatus => _cityListStatus;


  bool _dataStatus = false;
  bool get dataStatus => _dataStatus;



 Future fachingApiCityList() async{


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



     if (apiResponse.statusCode == 200) {

       if (jsonDecode(apiResponse.body)['success']) {

         _cityModel = CityModel.fromJson(jsonDecode(apiResponse.body));
         _cityListStatus = false;
         _dataStatus = true;

         notifyListeners();
       } else {

         _dataStatus = false;
         _cityListStatus = false;
         notifyListeners();
       }
     } else {

       _dataStatus = false;
       _cityListStatus = false;
       notifyListeners();

     }
   } on Exception catch (e) {

     _dataStatus = false;

     _cityListStatus = false;
     notifyListeners();
     // TODO
   }
 }

}