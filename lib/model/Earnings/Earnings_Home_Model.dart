// To parse this JSON data, do
//
//     final earningsHomeModel = earningsHomeModelFromJson(jsonString);

import 'dart:convert';

EarningsHomeModel earningsHomeModelFromJson(String str) => EarningsHomeModel.fromJson(json.decode(str));

String earningsHomeModelToJson(EarningsHomeModel data) => json.encode(data.toJson());

class EarningsHomeModel {
  EarningsHomeModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory EarningsHomeModel.fromJson(Map<String, dynamic> json) => EarningsHomeModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    response: json["response"] == null ? null : Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "response": response == null ? null : response?.toJson(),
  };
}

class Response {
  Response({
    this.lifetimepuja,
    this.lifetimeearnings,
    this.walletvalue,
  });

  int? lifetimepuja;
  String? lifetimeearnings;
  String? walletvalue;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    lifetimepuja: json["lifetimepuja"] == null ? null : json["lifetimepuja"],
    lifetimeearnings: json["lifetimeearnings"] == null ? null : json["lifetimeearnings"],
    walletvalue: json["walletvalue"] == null ? null : json["walletvalue"],
  );

  Map<String, dynamic> toJson() => {
    "lifetimepuja": lifetimepuja == null ? null : lifetimepuja,
    "lifetimeearnings": lifetimeearnings == null ? null : lifetimeearnings,
    "walletvalue": walletvalue == null ? null : walletvalue,
  };
}
