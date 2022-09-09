import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../Consts/text_const.dart';
import '../Util/api_status.dart';

import 'package:http/http.dart' as http;

class ApiRemoteServices {
  static Future<Object?> fechingGetApi({String? apiUrl, apiData}) async {
    try {
      Map? body = apiData;
      var url = Uri.parse(apiUrl!);
      // Map<String,String> header = await getHeader();
      var headers = {
        'Authorization': 'Basic YW05dVpVQXlPVGM0OlJrbFVUa1ZUVTBBak1USXo=',
      };
      var response = await http
          .post(url, body: body, headers: headers)
          .timeout(const Duration(seconds: 15));
      if (response.statusCode == 200) {
        print("Govind Bookin Api  success${response.body}");
        return Success(response: response.body);
      }
    } on HttpException {
      return Failure(code: httpException, errorResponse: httpExceptionMsg);
    } on SocketException {
      return Failure(code: noInternet, errorResponse: noInternetMsg);
    } on FormatException {
      return Failure(code: invalidFormat, errorResponse: invalidFormatMsg);
    } on TimeoutException {
      return Failure(code: timeout, errorResponse: timeoutMsg);
    } catch (e) {
      log("Error $e");
      return Failure(code: unknownError, errorResponse: unknownErrorMsg);
    }
  }
}
