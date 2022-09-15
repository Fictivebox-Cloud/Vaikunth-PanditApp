// To parse this JSON data, do
//
//     final bankListModel = bankListModelFromJson(jsonString);

import 'dart:convert';

BankListModel bankListModelFromJson(String str) => BankListModel.fromJson(json.decode(str));

String bankListModelToJson(BankListModel data) => json.encode(data.toJson());

class BankListModel {
  BankListModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory BankListModel.fromJson(Map<String, dynamic> json) => BankListModel(
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
    this.banklist,
  });

  List<Banklist>? banklist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    banklist: json["banklist"] == null ? null : List<Banklist>.from(json["banklist"].map((x) => Banklist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banklist": banklist == null ? null : List<dynamic>.from(banklist!.map((x) => x.toJson())),
  };
}

class Banklist {
  Banklist({
    this.id,
    this.bankName,
    this.status,
  });

  int? id;
  String? bankName;
  String? status;

  factory Banklist.fromJson(Map<String, dynamic> json) => Banklist(
    id: json["id"] == null ? null : json["id"],
    bankName: json["bank_name"] == null ? null : json["bank_name"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "bank_name": bankName == null ? null : bankName,
    "status": status == null ? null : status,
  };
}
