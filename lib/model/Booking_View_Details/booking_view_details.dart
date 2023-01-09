// To parse this JSON data, do
//
//     final pujaConfirmOtpModel = pujaConfirmOtpModelFromJson(jsonString);

import 'dart:convert';

PujaConfirmOtpModel pujaConfirmOtpModelFromJson(String str) => PujaConfirmOtpModel.fromJson(json.decode(str));

String pujaConfirmOtpModelToJson(PujaConfirmOtpModel data) => json.encode(data.toJson());

class PujaConfirmOtpModel {
  PujaConfirmOtpModel({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory PujaConfirmOtpModel.fromJson(Map<String, dynamic> json) => PujaConfirmOtpModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
  };
}
