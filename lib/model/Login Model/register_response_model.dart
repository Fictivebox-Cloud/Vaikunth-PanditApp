// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) =>
    json.encode(data.toJson());

class RegisterResponseModel {
  RegisterResponseModel({this.success, this.message, this.response});

  bool? success;
  String? message;
  Response? response;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        success: json["success"],
        message: json["message"],
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "response": response!.toJson(),
      };
}

class Response {
  Response({this.panditRegister, this.panditRegisterId, this.newUser});

  bool? panditRegister;
  int? panditRegisterId;
  bool? newUser;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
      panditRegister: json["pandit_register"],
      panditRegisterId: json["pandit_register_id"],
      newUser: json["new_user"]);

  Map<String, dynamic> toJson() => {
        "pandit_register": panditRegister,
        "pandit_register_id": panditRegisterId,
        "new_user": newUser
      };
}
