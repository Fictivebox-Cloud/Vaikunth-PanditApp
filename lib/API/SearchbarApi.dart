 import 'dart:convert';

import 'package:get/get.dart';
import 'package:panditapp/model/City_Model.dart';
 import 'package:http/http.dart' as http;

 class ApiCallCitylistPage extends GetxController {
   late bool searching, error;
   var data;



   // static  var  client = http.Client();

   static Future<CityModel?> fetchCityList() async {
     final limit = 3;


     String username = 'am9uZUAyOTc4';
     String password = 'RklUTkVTU0AjMTIz';
     String basicAuth =
         'Basic ' + base64.encode(utf8.encode('$username:$password'));
     print(basicAuth);

     var response = await http.post(
       Uri.parse("https://vaikunth.fictivebox.com/api/getcitylist"),
       headers: <String, String>{'authorization': basicAuth},

     );
     if (response.statusCode == 200) {
       var responsedata = jsonDecode(response.body);
      print(response.body);
     }
     else {
       Get.snackbar("Error", "Eroor while communicating with API");
     }
   }
 }