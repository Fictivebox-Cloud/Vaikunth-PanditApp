import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../Helper/appState.dart';
import '../Util/api_status.dart';

import 'package:http/http.dart' as http;
import '../consts/text_consts.dart';

class ApiRemoteServices {
    static Future<Object?> fechingGetApi ({String? apiUrl, apiData}) async{

        try{
            Map? body = apiData;
            var url = Uri.parse(apiUrl!);
            // Map<String,String> header = await getHeader();

            var headers = {
                'Authorization': 'Basic YW05dVpVQXlPVGM0OlJrbFVUa1ZUVTBBak1USXo=',
                //'Content-Type': 'application/json'
            };
            var response = await http.post(url,body: {"pandit_id": "81"}, headers: headers
            ).timeout(const Duration(seconds: 15));


            if(response.statusCode ==200){

                print("Govind Bookin Api  success${response.body}");
                return Success(response: response.body);

            }
        }on HttpException{
            return Failure(code:  httpException, errorResponse: httpExceptionMsg);
        }
        on SocketException{
            return Failure(code: noInternet, errorResponse: noInternetMsg);
        }on FormatException{
            return Failure(code: invalidFormat,errorResponse: invalidFormatMsg);
        }on TimeoutException{
            return Failure(code: timeout, errorResponse: timeoutMsg);
        }
        catch (e){
            log("Error $e");
            return Failure(code: unknownError,errorResponse: unknownErrorMsg);
        }
    }

}
