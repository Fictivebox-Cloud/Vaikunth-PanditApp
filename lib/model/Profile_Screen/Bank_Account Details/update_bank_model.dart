// To parse this JSON data, do
//
//     final updateBankModel = updateBankModelFromJson(jsonString);

import 'dart:convert';

UpdateBankModel updateBankModelFromJson(String str) => UpdateBankModel.fromJson(json.decode(str));

String updateBankModelToJson(UpdateBankModel data) => json.encode(data.toJson());

class UpdateBankModel {
  UpdateBankModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory UpdateBankModel.fromJson(Map<String, dynamic> json) => UpdateBankModel(
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
    bankDetails: json["bankDetails"] == null ? null : json["bankDetails"],
  );

  Map<String, dynamic> toJson() => {
    "bankDetails": bankDetails == null ? null : bankDetails,
  };
}
