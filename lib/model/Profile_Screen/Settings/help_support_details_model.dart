// To parse this JSON data, do
//
//     final helpSupportDetailsModel = helpSupportDetailsModelFromJson(jsonString);

import 'dart:convert';

HelpSupportDetailsModel helpSupportDetailsModelFromJson(String str) => HelpSupportDetailsModel.fromJson(json.decode(str));

String helpSupportDetailsModelToJson(HelpSupportDetailsModel data) => json.encode(data.toJson());

class HelpSupportDetailsModel {
  HelpSupportDetailsModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory HelpSupportDetailsModel.fromJson(Map<String, dynamic> json) => HelpSupportDetailsModel(
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
    this.helplist,
  });

  List<Helplist>? helplist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    helplist: json["helplist"] == null ? null : List<Helplist>.from(json["helplist"].map((x) => Helplist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "helplist": helplist == null ? null : List<dynamic>.from(helplist!.map((x) => x.toJson())),
  };
}

class Helplist {
  Helplist({
    this.helpEmail,
    this.helpMobile,
  });

  dynamic helpEmail;
  dynamic helpMobile;

  factory Helplist.fromJson(Map<String, dynamic> json) => Helplist(
    helpEmail: json["help_email"],
    helpMobile: json["help_mobile"],
  );

  Map<String, dynamic> toJson() => {
    "help_email": helpEmail,
    "help_mobile": helpMobile,
  };
}
