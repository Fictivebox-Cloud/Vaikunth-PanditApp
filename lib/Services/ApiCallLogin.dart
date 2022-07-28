import 'dart:convert';
import 'dart:io';

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

      })
      async {
    var url = Uri.parse("https://vaikunth.fictivebox.com/api/register"
    );
    Map<String,String> data ={
       'pandit_mobile': mobile,
       'pandit_name': name,
       'pandit_services': services,
       'pandit_city': city,
       'pandit_aadhar_number':aadharnumber,
       'pandit_pan_number': pannumber,
       'pandit_account_number':account_number,
       'pandit_bank':bank,
       'pandit_ifsc':ifsc,


     };
    var request = http.MultipartRequest('POST', url);
    request.fields.addAll(data);
    photo == null ? null : request.files.add(
      await http.MultipartFile.fromPath('pandit_image',photo.toString()),
    );
    aadharfrontphoto == null ? null : request.files.add(
      await http.MultipartFile.fromPath('pandit_aadhar_front',aadharfrontphoto.toString()),
    );
    aadharbackphoto == null ? null : request.files.add(
      await http.MultipartFile.fromPath('pandit_aadhar_back',aadharbackphoto.toString()),
    );
    panfile == null ? null : request.files.add(
      await http.MultipartFile.fromPath('pandit_pan_file',panfile.toString()),
    );
    var response = await request.send();
    print("res${response}");
    response.stream.transform(utf8.decoder).listen((value) {
      print("API Call ");
      print(value);
      Map qw = jsonDecode(value);
      print("Abhishek$qw");
    });
  }




//
// Future  fechingloginApi(
//     {
//       String? mobile,
//       String? name,
//       String? services,
//       String? city,
//       String? aadharnumber,
//       String? pannumber,
//       String? account_number,
//       String? bank,
//       String? ifsc,
//       String? photo,
//       String? aadharfrontphoto,
//       String? aadharbackphoto,
//       String? aadharpanfile,
//
//     })
// async{
//
//
// //kiya hua
//   try {
//     String username = 'am9uZUAyOTc4';
//     String password = 'RklUTkVTU0AjMTIz';
//     String basicAuth = 'Basic ' + base64Encode('$username:$password'.codeUnits);
//     print(basicAuth);
//
//     Map map = Map<String, dynamic>();
//
//     map['pandit_mobile'] = mobile;
//     map['pandit_name'] = name;
//     map['pandit_services'] = services;
//     map['pandit_city'] = city;
//     map['pandit_aadhar_number'] = aadharnumber;
//     map['pandit_pan_number'] = pannumber;
//     map['pandit_account_number'] = account_number;
//     map['pandit_bank'] = bank;
//     map['pandit_ifsc'] = ifsc;
//     map['pandit_image'] = photo;
//     map['pandit_aadhar_front'] = aadharfrontphoto;
//     map['pandit_aadhar_back'] = aadharbackphoto;
//     map['pandit_pan_file'] = aadharpanfile;
//     map['pandit_name'] = name;
//
//
//      // Map data ={
//      //   'pandit_mobile': mobile,
//      //   'pandit_name': name,
//      //   'pandit_services': services,
//      //   'pandit_city': city,
//      //   'pandit_aadhar_number':aadharnumber,
//      //   'pandit_pan_number': pannumber,
//      //   'pandit_account_number':account_number,
//      //   'pandit_bank':bank,
//      //   'pandit_ifsc':ifsc,
//      //   'pandit_image':photo,
//      //   'pandit_aadhar_front':aadharfrontphoto,
//      //   'pandit_aadhar_back':aadharbackphoto,
//      //   'pandit_pan_file':aadharpanfile,
//      //
//      // };
//     print(map);
//     String body = json.encode(map);
//     var url= "https://vaikunth.fictivebox.com/api/register";
//     var response = await http.post(Uri.parse(url),body: map,
//         headers: <String, String>{'authorization': basicAuth}
//     );
//
//     if (response.statusCode == 200) {
//       print("API status => ${response.statusCode}");
//       print("API data => ${jsonDecode(response.body)}");
//
//       if (jsonDecode(response.body)['success']) {
//
//         _loginModel = LoginModel.fromJson(jsonDecode(response.body));
//         _eventListStatus = false;
//         _dataStatus = true;
//
//         notifyListeners();
//       } else {
//
//         _dataStatus = false;
//         _eventListStatus = false;
//         notifyListeners();
//       }
//     } else {
//
//       _dataStatus = false;
//       _eventListStatus = false;
//       notifyListeners();
//
//     }
//   } on Exception catch (e) {
//     // TODO
//     _dataStatus = false;
//
//     _eventListStatus = false;
//     notifyListeners();
//   }
//   }
//

}