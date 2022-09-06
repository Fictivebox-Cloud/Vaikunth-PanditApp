// To parse this JSON data, do
//
//     final onlineAndOfflineModel = onlineAndOfflineModelFromJson(jsonString);

import 'dart:convert';

OnlineAndOfflineModel onlineAndOfflineModelFromJson(String str) => OnlineAndOfflineModel.fromJson(json.decode(str));

String onlineAndOfflineModelToJson(OnlineAndOfflineModel data) => json.encode(data.toJson());

class OnlineAndOfflineModel {
  OnlineAndOfflineModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory OnlineAndOfflineModel.fromJson(Map<String, dynamic> json) => OnlineAndOfflineModel(
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
