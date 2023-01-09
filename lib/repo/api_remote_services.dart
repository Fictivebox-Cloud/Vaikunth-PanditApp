import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:panditapp/consts/text_const.dart';
import '../Util/api_status.dart';
import 'package:http/http.dart' as http;
import '../Util/getHeader.dart';

class ApiRemoteServices {
  static Future<Object?> fechingGetApi({String? apiUrl, dynamic apiData}) async {
    try {
      var url = Uri.parse(apiUrl!);
      Map<String,String> header = await getHeader();

      var response = await http
          .post(url, body: apiData, headers: header)
          .timeout(const Duration(seconds: timeoutSession));
      if (response.statusCode == successResponse) {
          log("Data: ${response.body}");
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
