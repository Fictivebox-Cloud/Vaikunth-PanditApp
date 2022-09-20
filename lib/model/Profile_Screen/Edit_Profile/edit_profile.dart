// To parse this JSON data, do
//
//     final editDetailsModel = editDetailsModelFromJson(jsonString);

import 'dart:convert';

EditDetailsModel editDetailsModelFromJson(String str) => EditDetailsModel.fromJson(json.decode(str));

String editDetailsModelToJson(EditDetailsModel data) => json.encode(data.toJson());

class EditDetailsModel {
  EditDetailsModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory EditDetailsModel.fromJson(Map<String, dynamic> json) => EditDetailsModel(
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
    this.bankDetails,
  });

  int ?bankDetails;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    bankDetails: json["bankDetails"] == null ? null : json["bankDetails"],
  );

  Map<String, dynamic> toJson() => {
    "bankDetails": bankDetails == null ? null : bankDetails,
  };
}
