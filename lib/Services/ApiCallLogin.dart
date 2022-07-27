import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:panditapp/model/Login_Model.dart';

class ApiCallLogin extends ChangeNotifier{
  bool _eventListStatus = false;
  bool get eventListStatus => _eventListStatus;

  bool _dataStatus = false;
  bool get dataStatus => _dataStatus;

  static  var  client = http.Client();
  LoginModel _loginModel = LoginModel();
  LoginModel get loginModel => _loginModel;





Future  fechingloginApi(
    {
      String? mobile,
      String? name,
      String? services,
      String? city,
      String? aadharnumber,
      String? pannumber,
      String? account_number,
      String? bank,
      String? ifsc,
      String? photo,
      String? aadharfrontphoto,
      String? aadharbackphoto,
      String? aadharpanfile,

    })async{


  try {
    String username = 'am9uZUAyOTc4';
    String password = 'RklUTkVTU0AjMTIz';
    String basicAuth = 'Basic ' + base64Encode('$username:$password'.codeUnits);
    print(basicAuth);
    
     Map data ={
       'pandit_mobile': mobile,
       'pandit_name': name,
       'pandit_services': services,
       'pandit_city': city,
       'pandit_aadhar_number':aadharnumber,
       'pandit_pan_number': pannumber,
       'pandit_account_number':account_number,
       'pandit_bank':bank,
       'pandit_ifsc':ifsc,
       'pandit_image':photo,
       'pandit_aadhar_front':aadharfrontphoto,
       'pandit_aadhar_back':aadharbackphoto,
       'pandit_pan_file':aadharpanfile,
    
     };
    print(data);
    String body = json.encode(data);
    var url= "https://vaikunth.fictivebox.com/api/register";
    var response = await http.post(Uri.parse(url),body: data,
        headers: <String, String>{'authorization': basicAuth}
    );

    if (response.statusCode == 200) {
      print("Vikrant${jsonDecode(response.body)}");

      if (jsonDecode(response.body)['success']) {

        _loginModel = LoginModel.fromJson(jsonDecode(response.body));
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
  

}