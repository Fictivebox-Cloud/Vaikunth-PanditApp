// To parse this JSON data, do
//
//     final rejectBookingModel = rejectBookingModelFromJson(jsonString);

import 'dart:convert';

RejectBookingModel rejectBookingModelFromJson(String str) => RejectBookingModel.fromJson(json.decode(str));

String rejectBookingModelToJson(RejectBookingModel data) => json.encode(data.toJson());

class RejectBookingModel {
  RejectBookingModel({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory RejectBookingModel.fromJson(Map<String, dynamic> json) => RejectBookingModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
  };
}
