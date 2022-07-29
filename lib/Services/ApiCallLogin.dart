import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class ApiCallLogin extends ChangeNotifier {
  bool _eventListStatus = false;

  bool get eventListStatus => _eventListStatus;

  bool _dataStatus = false;

  bool get dataStatus => _dataStatus;

  static var client = http.Client();


  Future fechingloginApi(
  {
      var mobile,
      var name,
      var services,
      var city,
      var aadharnumber,
      var pannumber,
      var account_number,
      var bank,
      var ifsc,
      var photo,
      var aadharfrontphoto,
      var aadharbackphoto,
      var panfile,
}
      ) async {


    String username = 'am9uZUAyOTc4';
    String password = 'RklUTkVTU0AjMTIz';
    String basicAuth = 'Basic ' + base64Encode('$username:$password'.codeUnits);
    print(basicAuth);

    Map<String, String> map = Map<String, String>();

    map['pandit_mobile'] = mobile.toString();
    map['pandit_name'] = name;
    map['pandit_services'] = services;
    map['pandit_city'] = city;
    map['pandit_aadhar_number'] = aadharnumber.toString();
    map['pandit_pan_number'] = pannumber.toString();
    map['pandit_account_number'] = account_number.toString();
    map['pandit_bank'] = bank;
    map['pandit_ifsc'] = ifsc;


    print(map);
    String body = json.encode(map);
    var url = Uri.parse("https://vaikunth.fictivebox.com/api/register");
     var response = await http.post(url,body: map,
         headers: <String, String>{'authorization': basicAuth}
     );

    // var res = await http.post(url, body: map, headers: <String, String>{'authorization': basicAuth});

    // print(res.statusCode);
    // print(res.body);

    // var request = http.MultipartRequest('POST', url);
    // request.fields.addAll(map);
    // request.headers.addAll(<String, String>{'authorization': basicAuth});
    // request.files.add(
    //   await http.MultipartFile.fromPath(
    //       'pandit_image', "https://search.brave.com/images?q=pic&source=web&img=0"),
    // );
    // request.files.add(
    //   await http.MultipartFile.fromPath(
    //       'pandit_aadhar_front', "https://search.brave.com/images?q=pic&source=web&img=0"),
    // );
    // request.files.add(
    //   await http.MultipartFile.fromPath(
    //       'pandit_aadhar_back', "https://search.brave.com/images?q=pic&source=web&img=0"),
    // );
    // request.files.add(
    //   await http.MultipartFile.fromPath(
    //       'pandit_pan_file', "https://search.brave.com/images?q=pic&source=web&img=0"),
    // );
    // var response = await request.send();
    // print("res${response}");
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print("API Call ");
    //   print(value);
    //   Map qw = jsonDecode(value);
    //   print("Abhishek$qw");
    // });


  if (response.statusCode == 200) {
    print("API status => ${response.statusCode}");
    print("API data => ${jsonDecode(response.body)}");

    if (jsonDecode(response.body)['success']) {
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
}

}


