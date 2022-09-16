// To parse this JSON data, do
//
//     final panditDetailsIdcradModel = panditDetailsIdcradModelFromJson(jsonString);

import 'dart:convert';

PanditDetailsIdcradModel panditDetailsIdcradModelFromJson(String str) => PanditDetailsIdcradModel.fromJson(json.decode(str));

String panditDetailsIdcradModelToJson(PanditDetailsIdcradModel data) => json.encode(data.toJson());

class PanditDetailsIdcradModel {
  PanditDetailsIdcradModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory PanditDetailsIdcradModel.fromJson(Map<String, dynamic> json) => PanditDetailsIdcradModel(
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
    this.panditIDcard,
  });

  List<PanditIDcard>? panditIDcard;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    panditIDcard: json["panditIDcard"] == null ? null : List<PanditIDcard>.from(json["panditIDcard"].map((x) => PanditIDcard.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "panditIDcard": panditIDcard == null ? null : List<dynamic>.from(panditIDcard!.map((x) => x.toJson())),
  };
}

class PanditIDcard {
  PanditIDcard({
    this.id,
    this.panditId,
    this.aadharFront,
    this.aadharBack,
    this.panCard,
    this.passbook,
    this.otherDocs,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? panditId;
  String? aadharFront;
  String? aadharBack;
  String? panCard;
  String? passbook;
  String? otherDocs;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PanditIDcard.fromJson(Map<String, dynamic> json) => PanditIDcard(
    id: json["id"] == null ? null : json["id"],
    panditId: json["pandit_id"] == null ? null : json["pandit_id"],
    aadharFront: json["aadhar_front"] == null ? null : json["aadhar_front"],
    aadharBack: json["aadhar_back"] == null ? null : json["aadhar_back"],
    panCard: json["pan_card"] == null ? null : json["pan_card"],
    passbook: json["passbook"] == null ? null : json["passbook"],
    otherDocs: json["other_docs"] == null ? null : json["other_docs"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "pandit_id": panditId == null ? null : panditId,
    "aadhar_front": aadharFront == null ? null : aadharFront,
    "aadhar_back": aadharBack == null ? null : aadharBack,
    "pan_card": panCard == null ? null : panCard,
    "passbook": passbook == null ? null : passbook,
    "other_docs": otherDocs == null ? null : otherDocs,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
