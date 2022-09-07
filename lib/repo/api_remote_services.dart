import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '../Helper/appState.dart';
import '../Util/api_status.dart';
import '../Util/getHeader.dart';
import 'package:http/http.dart' as http;

import '../consts/text_consts.dart';
import '../model/Booking Model/BookingModel.dart';
import '../model/Login Model/Login_Model.dart';

class ApiRemoteServices {

  // 1. Get Booking Api

    static Future<Object?> fechingGetBookingApi ({String? apiUrl, apiData})async{

        Map<String,String> header = await getHeader();
        print("URL $apiUrl");


        try{
            var url = Uri.parse(apiUrl!);
            Map? body = apiData;
            var response = await http.post(url,body: body, headers: header

            ).timeout(const Duration(seconds: 15));
            if(response.statusCode ==200){

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
            return Failure(code: unknownError,errorResponse: unknownErrorMsg);
        }
    }

    // 2. Get Login Api

    static Future<Object?> fechingGetLoginApi ({String? apiUrl,apiData}) async{


        print("URL $apiUrl");



        try{
            Map? body = apiData;
            var url = Uri.parse(apiUrl!);
            Map<String,String> header = await getHeader();
            var response = await http.post(url,body: body, headers: header
            ).timeout(const Duration(seconds: 15));
            print(response.statusCode);
            print(response.body);
            AppState nn = AppState();
            if(response.statusCode ==200){
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