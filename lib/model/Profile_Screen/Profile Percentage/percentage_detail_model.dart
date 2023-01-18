// To parse this JSON data, do
//
//     final percentageDetailModel = percentageDetailModelFromJson(jsonString);

import 'dart:convert';

PercentageDetailModel? percentageDetailModelFromJson(String str) => PercentageDetailModel.fromJson(json.decode(str));

String percentageDetailModelToJson(PercentageDetailModel? data) => json.encode(data!.toJson());

class PercentageDetailModel {
  PercentageDetailModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory PercentageDetailModel.fromJson(Map<String, dynamic> json) => PercentageDetailModel(
    success: json["success"],
    message: json["message"],
    response: json["response"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "response": response,
  };
}

class Response {
  Response({
    this.percentage,
  });

  int? percentage;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    percentage: json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "percentage": percentage,
  };
}
