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
    this.panditIDcard,
    this.panditbanklist,
  });

  PanditDetails? panditDetails;
  List<PanditIDcard>? panditIDcard;
  List<Panditbanklist>? panditbanklist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    panditDetails: json["panditDetails"] == null ? null : PanditDetails.fromJson(json["panditDetails"]),
    panditIDcard: json["panditIDcard"] == null ? null : List<PanditIDcard>.from(json["panditIDcard"].map((x) => PanditIDcard.fromJson(x))),
    panditbanklist: json["panditbanklist"] == null ? null : List<Panditbanklist>.from(json["panditbanklist"].map((x) => Panditbanklist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "panditDetails": panditDetails == null ? null : panditDetails!.toJson(),
    "panditIDcard": panditIDcard == null ? null : List<dynamic>.from(panditIDcard!.map((x) => x.toJson())),
    "panditbanklist": panditbanklist == null ? null : List<dynamic>.from(panditbanklist!.map((x) => x.toJson())),
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
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
