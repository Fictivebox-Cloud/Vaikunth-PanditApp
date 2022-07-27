// To parse this JSON data, do
//
//     final acceptBookingModel = acceptBookingModelFromJson(jsonString);

import 'dart:convert';

AcceptBookingModel acceptBookingModelFromJson(String str) => AcceptBookingModel.fromJson(json.decode(str));

String acceptBookingModelToJson(AcceptBookingModel data) => json.encode(data.toJson());

class AcceptBookingModel {
  AcceptBookingModel({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory AcceptBookingModel.fromJson(Map<String, dynamic> json) => AcceptBookingModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
  };
}
