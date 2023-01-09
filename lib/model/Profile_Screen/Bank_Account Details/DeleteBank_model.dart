// To parse this JSON data, do
//
//     final deleteBankModel = deleteBankModelFromJson(jsonString);

import 'dart:convert';

DeleteBankModel deleteBankModelFromJson(String str) => DeleteBankModel.fromJson(json.decode(str));

String deleteBankModelToJson(DeleteBankModel data) => json.encode(data.toJson());

class DeleteBankModel {
  DeleteBankModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory DeleteBankModel.fromJson(Map<String, dynamic> json) => DeleteBankModel(
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

  dynamic bankDetails;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    bankDetails: json["bankDetails"],
  );

  Map<String, dynamic> toJson() => {
    "bankDetails": bankDetails,
  };
}
