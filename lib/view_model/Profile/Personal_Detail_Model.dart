// To parse this JSON data, do
//
//     final personalDetailModel = personalDetailModelFromJson(jsonString);

import 'dart:convert';

PersonalDetailModel personalDetailModelFromJson(String str) => PersonalDetailModel.fromJson(json.decode(str));

String personalDetailModelToJson(PersonalDetailModel data) => json.encode(data.toJson());

class PersonalDetailModel {
  PersonalDetailModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory PersonalDetailModel.fromJson(Map<String, dynamic> json) => PersonalDetailModel(
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
    this.panditDetails,
  });

  PanditDetails ?panditDetails;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    panditDetails: json["panditDetails"] == null ? null : PanditDetails.fromJson(json["panditDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "panditDetails": panditDetails == null ? null : panditDetails!.toJson(),
  };
}

class PanditDetails {
  PanditDetails({
    this.id,
    this.panditFirstName,
    this.panditLastName,
    this.panditEmail,
    this.panditServices,
    this.panditMobile,
    this.panditAadhar,
    this.panditAge,
    this.panditImage,
    this.panditCity,
    this.panditVerified,
  });

  int? id;
  String? panditFirstName;
  String? panditLastName;
  String? panditEmail;
  dynamic? panditServices;
  String? panditMobile;
  String? panditAadhar;
  int? panditAge;
  String? panditImage;
  dynamic? panditCity;
  int? panditVerified;

  factory PanditDetails.fromJson(Map<String, dynamic> json) => PanditDetails(
    id: json["id"] == null ? null : json["id"],
    panditFirstName: json["pandit_first_name"] == null ? null : json["pandit_first_name"],
    panditLastName: json["pandit_last_name"] == null ? null : json["pandit_last_name"],
    panditEmail: json["pandit_email"] == null ? null : json["pandit_email"],
    panditServices: json["pandit_services"],
    panditMobile: json["pandit_mobile"] == null ? null : json["pandit_mobile"],
    panditAadhar: json["pandit_aadhar"] == null ? null : json["pandit_aadhar"],
    panditAge: json["pandit_age"] == null ? null : json["pandit_age"],
    panditImage: json["pandit_image"] == null ? null : json["pandit_image"],
    panditCity: json["pandit_city"],
    panditVerified: json["pandit_verified"] == null ? null : json["pandit_verified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "pandit_first_name": panditFirstName == null ? null : panditFirstName,
    "pandit_last_name": panditLastName == null ? null : panditLastName,
    "pandit_email": panditEmail == null ? null : panditEmail,
    "pandit_services": panditServices,
    "pandit_mobile": panditMobile == null ? null : panditMobile,
    "pandit_aadhar": panditAadhar == null ? null : panditAadhar,
    "pandit_age": panditAge == null ? null : panditAge,
    "pandit_image": panditImage == null ? null : panditImage,
    "pandit_city": panditCity,
    "pandit_verified": panditVerified == null ? null : panditVerified,
  };
}
