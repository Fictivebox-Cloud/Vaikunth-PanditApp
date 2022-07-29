import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/City_Model.dart';

import 'package:http/http.dart' as http;

class City_List_Api extends ChangeNotifier {

  CityModel _cityModel = CityModel();

  CityModel get cityMidel => _cityModel;


  bool _cityListStatus = false;

  bool get cityListStatus => _cityListStatus;


  bool _dataStatus = false;


  bool get dataStatus => _dataStatus;


  static Future fachingApiCityList() async {

    
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

        final data  = jsonEncode(apiResponse.body);


      } else {
        throw Exception("Error");
      }
    } on Exception catch (e) {
      throw Exception(e.toString());

      // TODO
    }
  }
  static List<CityModel> parseUsers(String responseBody) {

    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CityModel>((json) => CityModel.fromJson(json)).toList();
  }


  }



