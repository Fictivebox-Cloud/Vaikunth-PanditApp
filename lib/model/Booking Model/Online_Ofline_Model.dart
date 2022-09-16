// To parse this JSON data, do
//
//     final onlineOflineModel = onlineOflineModelFromJson(jsonString);

import 'dart:convert';

OnlineOflineModel onlineOflineModelFromJson(String str) => OnlineOflineModel.fromJson(json.decode(str));

String onlineOflineModelToJson(OnlineOflineModel data) => json.encode(data.toJson());

class OnlineOflineModel {
  OnlineOflineModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory OnlineOflineModel.fromJson(Map<String, dynamic> json) => OnlineOflineModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    response: json["response"] == null ? null : Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "response": response == null ? null : response!.toJson(),
  };
}

class Response {
  Response({
    this.onlinestatus,
  });

  String? onlinestatus;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    onlinestatus: json["onlinestatus"] == null ? null : json["onlinestatus"],
  );

  Map<String, dynamic> toJson() => {
    "onlinestatus": onlinestatus == null ? null : onlinestatus,
  };
}
