import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../Helper/appState.dart';
import '../Util/api_status.dart';
import '../Util/getHeader.dart';
import 'package:http/http.dart' as http;
import '../consts/text_consts.dart';

class ApiRemoteServices {
    static Future<Object?> fechingGetApi ({String? apiUrl, apiData}) async{
        print("URL $apiUrl");

        try{
            Map? body = apiData;
            var url = Uri.parse(apiUrl!);
            // Map<String,String> header = await getHeader();
            String username = 'am9uZUAyOTc4';
            String password = 'RklUTkVTU0AjMTIz';

            String basicAuth = 'Basic' + base64Encode('$username:$password'.codeUnits);
            Map<String, String> headers;
            headers = {"Authorization": basicAuth};
            var response = await http.post(url,body: {"pandit_id": "8"}, headers: headers
            ).timeout(const Duration(seconds: 15));
            print(response.statusCode);
            print(response.body);

            if(response.statusCode ==200){
                print(response.body);
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