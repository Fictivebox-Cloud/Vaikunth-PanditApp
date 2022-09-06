import 'dart:convert';

Future<Map<String,String>> getHeader() async{
  String username = 'am9uZUAyOTc4';
  String password = 'RklUTkVTU0AjMTIz';

  String basicAuth = 'Basic' + base64Encode('$username:$password'.codeUnits);
  Map<String, String> headers;
  headers = {"Authorization": basicAuth};
  return headers;
}