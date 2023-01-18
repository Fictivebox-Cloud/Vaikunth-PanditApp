// To parse this JSON data, do
//
//     final panditBankListModel = panditBankListModelFromJson(jsonString);

import 'dart:convert';

PanditBankListModel panditBankListModelFromJson(String str) => PanditBankListModel.fromJson(json.decode(str));

String panditBankListModelToJson(PanditBankListModel data) => json.encode(data.toJson());

class PanditBankListModel {
  PanditBankListModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory PanditBankListModel.fromJson(Map<String, dynamic> json) => PanditBankListModel(
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
    this.panditbanklist,
  });

  List<Panditbanklist>? panditbanklist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    panditbanklist: json["panditbanklist"] == null ? null : List<Panditbanklist>.from(json["panditbanklist"].map((x) => Panditbanklist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "panditbanklist": panditbanklist == null ? null : List<dynamic>.from(panditbanklist!.map((x) => x.toJson())),
  };
}

class Panditbanklist {
  Panditbanklist({
    this.id,
    this.panditId,
    this.bankName,
    this.accountHolderName,
    this.ifscCode,
    this.bankAddress,
    this.bankAccountNo,
    this.panNo,
    this.aadharNo,
    this.defaultBank,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? panditId;
  String? bankName;
  String? accountHolderName;
  String? ifscCode;
  String? bankAddress;
  String? bankAccountNo;
  String? panNo;
  String? aadharNo;
  String? defaultBank;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Panditbanklist.fromJson(Map<String, dynamic> json) => Panditbanklist(
    id: json["id"] == null ? null : json["id"],
    panditId: json["pandit_id"] == null ? null : json["pandit_id"],
    bankName: json["bank_name"] == null ? null : json["bank_name"],
    accountHolderName: json["account_holder_name"] == null ? null : json["account_holder_name"],
    ifscCode: json["ifsc_code"] == null ? null : json["ifsc_code"],
    bankAddress: json["bank_address"] == null ? null : json["bank_address"],
    bankAccountNo: json["bank_account_no"] == null ? null : json["bank_account_no"],
    panNo: json["pan_no"] == null ? null : json["pan_no"],
    aadharNo: json["aadhar_no"] == null ? null : json["aadhar_no"],
    defaultBank: json["defaultBank"] == null ? null : json["defaultBank"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "pandit_id": panditId == null ? null : panditId,
    "bank_name": bankName == null ? null : bankName,
    "account_holder_name": accountHolderName == null ? null : accountHolderName,
    "ifsc_code": ifscCode == null ? null : ifscCode,
    "bank_address": bankAddress == null ? null : bankAddress,
    "bank_account_no": bankAccountNo == null ? null : bankAccountNo,
    "pan_no": panNo == null ? null : panNo,
    "aadhar_no": aadharNo == null ? null : aadharNo,
    "defaultBank": defaultBank == null ? null : defaultBank,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };
}
