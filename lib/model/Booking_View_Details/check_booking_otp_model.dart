// To parse this JSON data, do
//
//     final checkBookingConfirmOtpModel = checkBookingConfirmOtpModelFromJson(jsonString);

import 'dart:convert';

CheckBookingConfirmOtpModel checkBookingConfirmOtpModelFromJson(String str) => CheckBookingConfirmOtpModel.fromJson(json.decode(str));

String checkBookingConfirmOtpModelToJson(CheckBookingConfirmOtpModel data) => json.encode(data.toJson());

class CheckBookingConfirmOtpModel {
  CheckBookingConfirmOtpModel({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory CheckBookingConfirmOtpModel.fromJson(Map<String, dynamic> json) => CheckBookingConfirmOtpModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
  };
}
