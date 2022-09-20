// To parse this JSON data, do
//
//     final storeBankModel = storeBankModelFromJson(jsonString);

import 'dart:convert';

StoreBankModel storeBankModelFromJson(String str) => StoreBankModel.fromJson(json.decode(str));

String storeBankModelToJson(StoreBankModel data) => json.encode(data.toJson());

class StoreBankModel {
  StoreBankModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory StoreBankModel.fromJson(Map<String, dynamic> json) => StoreBankModel(
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
    this.bankDetails,
  });

  int? bankDetails;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    bankDetails: json["bank_details"] == null ? null : json["bank_details"],
  );

  Map<String, dynamic> toJson() => {
    "bank_details": bankDetails == null ? null : bankDetails,
  };
}
