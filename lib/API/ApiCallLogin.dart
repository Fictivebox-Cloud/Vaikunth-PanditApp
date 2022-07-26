import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiCallLogin extends ChangeNotifier{

  static  var  client = http.Client();



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


  var jsonResponse ;
  String username = 'am9uZUAyOTc4';
  String password = 'RklUTkVTU0AjMTIz';
  String basicAuth =
      'Basic ' + base64.encode(utf8.encode('$username:$password'));
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
  var response = await http.post(Uri.parse(url),body: body,
      headers: <String, String>{'authorization': basicAuth}
  );
  print(response.body);
  print(response.statusCode);
  if(response.statusCode ==200){


  }
  else{
    Get.snackbar("Error", "Eroor while communicating with API");
  }
  }
  

}