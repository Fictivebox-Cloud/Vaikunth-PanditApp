// To parse this JSON data, do
//
//     final numberVerifyModel = numberVerifyModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

NumberVerifyModel numberVerifyModelFromJson(String str) =>
    NumberVerifyModel.fromJson(json.decode(str));

String numberVerifyModelToJson(NumberVerifyModel data) =>
    json.encode(data.toJson());

class NumberVerifyModel {
  NumberVerifyModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory NumberVerifyModel.fromJson(Map<String, dynamic> json) =>
      NumberVerifyModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "response": response == null ? null : response?.toJson(),
      };
}

class Response {
  Response({this.panditDetails, this.notRegistered});

  PanditDetails? panditDetails;
  bool? notRegistered;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        notRegistered:
            json["not_register"] == null ? false : json["not_register"],
        panditDetails: json["panditDetails"] == null
            ? null
            : PanditDetails.fromJson(
                json["panditDetails"],
              ),
      );

  Map<String, dynamic> toJson() => {
        "panditDetails": panditDetails == null ? null : panditDetails?.toJson(),
      };
}

class PanditDetails {
  PanditDetails(
      {this.id,
      this.panditFirstName,
      this.panditLastName,
      this.panditEmail,
      this.panditServices,
      this.panditMobile,
      this.panditAadhar,
      this.panditAge,
      this.panditImage,
      this.panditCity});

  int? id;
  String? panditFirstName;
  dynamic panditLastName;
  dynamic panditEmail;
  String? panditServices;
  String? panditMobile;
  String? panditAadhar;
  dynamic panditAge;
  String? panditImage;
  String? panditCity;

  factory PanditDetails.fromJson(Map<String, dynamic> json) => PanditDetails(
        id: json["id"] == null ? null : json["id"],
        panditFirstName: json["pandit_first_name"] == null
            ? null
            : json["pandit_first_name"],
        panditLastName: json["pandit_last_name"],
        panditEmail: json["pandit_email"],
        panditServices:
            json["pandit_services"] == null ? null : json["pandit_services"],
        panditMobile:
            json["pandit_mobile"] == null ? null : json["pandit_mobile"],
        panditAadhar:
            json["pandit_aadhar"] == null ? null : json["pandit_aadhar"],
        panditAge: json["pandit_age"],
        panditImage: json["pandit_image"] == null ? null : json["pandit_image"],
        panditCity: json["pandit_city"] == null ? null : json["pandit_city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "pandit_first_name": panditFirstName == null ? null : panditFirstName,
        "pandit_last_name": panditLastName,
        "pandit_email": panditEmail,
        "pandit_services": panditServices == null ? null : panditServices,
        "pandit_mobile": panditMobile == null ? null : panditMobile,
        "pandit_aadhar": panditAadhar == null ? null : panditAadhar,
        "pandit_age": panditAge,
        "pandit_image": panditImage == null ? null : panditImage,
        "pandit_city": panditCity,
      };
}
