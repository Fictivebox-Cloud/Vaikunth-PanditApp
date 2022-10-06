// To parse this JSON data, do
//
//     final weekdataPerdayModel = weekdataPerdayModelFromJson(jsonString);

import 'dart:convert';

WeekdataPerdayModel weekdataPerdayModelFromJson(String str) => WeekdataPerdayModel.fromJson(json.decode(str));

String weekdataPerdayModelToJson(WeekdataPerdayModel data) => json.encode(data.toJson());

class WeekdataPerdayModel {
  WeekdataPerdayModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory WeekdataPerdayModel.fromJson(Map<String, dynamic> json) => WeekdataPerdayModel(
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
    this.weekdata,
    this.online,
    this.offline,
  });

  List<Weekdatum>? weekdata;
  int? online;
  int? offline;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    weekdata: json["weekdata"] == null ? null : List<Weekdatum>.from(json["weekdata"].map((x) => Weekdatum.fromJson(x))),
    online: json["online"] == null ? null : json["online"],
    offline: json["offline"] == null ? null : json["offline"],
  );

  Map<String, dynamic> toJson() => {
    "weekdata": weekdata == null ? null : List<dynamic>.from(weekdata!.map((x) => x.toJson())),
    "online": online == null ? null : online,
    "offline": offline == null ? null : offline,
  };
}

class Weekdatum {
  Weekdatum({
    this.myDate,
    this.perdaybooking,
    this.pujaMode,
  });

  DateTime? myDate;
  int? perdaybooking;
  String? pujaMode;

  factory Weekdatum.fromJson(Map<String, dynamic> json) => Weekdatum(
    myDate: json["my_date"] == null ? null : DateTime.parse(json["my_date"]),
    perdaybooking: json["perdaybooking"] == null ? null : json["perdaybooking"],
    pujaMode: json["puja_mode"] == null ? null : json["puja_mode"],
  );

  Map<String, dynamic> toJson() => {
    "my_date": myDate == null ? null : "${myDate!.year.toString().padLeft(4, '0')}-${myDate!.month.toString().padLeft(2, '0')}-${myDate!.day.toString().padLeft(2, '0')}",
    "perdaybooking": perdaybooking == null ? null : perdaybooking,
    "puja_mode": pujaMode == null ? null : pujaMode,
  };
}
