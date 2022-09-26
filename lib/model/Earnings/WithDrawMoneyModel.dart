/*// To parse this JSON data, do
//
//     final withDrawMoneyModel = withDrawMoneyModelFromJson(jsonString);

import 'dart:convert';

WithDrawMoneyModel withDrawMoneyModelFromJson(String str) => WithDrawMoneyModel.fromJson(json.decode(str));

String withDrawMoneyModelToJson(WithDrawMoneyModel data) => json.encode(data.toJson());

class WithDrawMoneyModel {
  WithDrawMoneyModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  String? response;

  factory WithDrawMoneyModel.fromJson(Map<String, dynamic> json) => WithDrawMoneyModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    response: json["response"] == null ? null : json["response"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "response": response == null ? null : response,
  };
}
*/
// To parse this JSON data, do
//
//     final withDrawMoneyModel = withDrawMoneyModelFromJson(jsonString);

import 'dart:convert';

WithDrawMoneyModel withDrawMoneyModelFromJson(String str) => WithDrawMoneyModel.fromJson(json.decode(str));

String withDrawMoneyModelToJson(WithDrawMoneyModel data) => json.encode(data.toJson());

class WithDrawMoneyModel {
  WithDrawMoneyModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory WithDrawMoneyModel.fromJson(Map<String, dynamic> json) => WithDrawMoneyModel(
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
    this.accountId,
    this.amount,
  });

  List<String>? accountId;
  List<String>? amount;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    accountId: json["account_id"] == null ? null : List<String>.from(json["account_id"].map((x) => x)),
    amount: json["amount"] == null ? null : List<String>.from(json["amount"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "account_id": accountId == null ? null : List<dynamic>.from(accountId!.map((x) => x)),
    "amount": amount == null ? null : List<dynamic>.from(amount!.map((x) => x)),
  };
}