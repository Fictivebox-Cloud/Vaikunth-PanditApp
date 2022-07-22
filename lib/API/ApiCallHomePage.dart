import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/bookingModel.dart';


class ApiCallHomePage extends GetxController {



 static Future<Bookinglist?> fetchBooking() async{


   String username = 'am9uZUAyOTc4';
   String password = 'RklUTkVTU0AjMTIz';
   String basicAuth =
       'Basic ' + base64.encode(utf8.encode('$username:$password'));
   print(basicAuth);

   try {
     var response =await  http.post(Uri.parse("https://vaikunth.fictivebox.com/api/getbookinglist"),
         headers: <String, String>{'authorization': basicAuth},
         body: {
           "pandit_id": "8"
         }
     );
     if(response.statusCode ==200){
       Map responsedata =jsonDecode(response.body);

     }
     else{
       Get.snackbar("Error", "Eroor while communicating with API");
     }
   } on Exception catch (e) {
     // TODO
   }
 }


}