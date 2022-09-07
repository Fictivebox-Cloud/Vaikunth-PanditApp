// To parse this JSON data, do
//
//     final completebokingmodel = completebokingmodelFromJson(jsonString);

import 'dart:convert';

Completebokingmodel completebokingmodelFromJson(String str) => Completebokingmodel.fromJson(json.decode(str));

String completebokingmodelToJson(Completebokingmodel data) => json.encode(data.toJson());

class Completebokingmodel {
  Completebokingmodel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory Completebokingmodel.fromJson(Map<String, dynamic> json) => Completebokingmodel(
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
    this.compbookinglist,
  });

  List<Compbookinglist>? compbookinglist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    compbookinglist: json["compbookinglist"] == null ? null : List<Compbookinglist>.from(json["compbookinglist"].map((x) => Compbookinglist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "compbookinglist": compbookinglist == null ? null : List<dynamic>.from(compbookinglist!.map((x) => x.toJson())),
  };
}

class Compbookinglist {
  Compbookinglist({
    this.poojaTitle,
    this.poojaDate,
    this.address,
    this.country,
    this.cityname,
    this.statename,
    this.pinCode,
    this.bookingPujaDate,
    this.updatedAt,
    this.completedAt,
    this.bookingid,
    this.bookingStatus,
    this.totalEarning,
    this.hostname,
  });

  String? poojaTitle;
  String? poojaDate;
  String? address;
  String? country;
  String? cityname;
  String? statename;
  int? pinCode;
  String? bookingPujaDate;
  DateTime? updatedAt;
  DateTime? completedAt;
  int? bookingid;
  String? bookingStatus;
  int? totalEarning;
  String? hostname;

  factory Compbookinglist.fromJson(Map<String, dynamic> json) => Compbookinglist(
    poojaTitle: json["pooja_title"] == null ? null : json["pooja_title"],
    poojaDate: json["pooja_date"] == null ? null : json["pooja_date"],
    address: json["address"] == null ? null : json["address"],
    country: json["country"] == null ? null : json["country"],
    cityname: json["cityname"] == null ? null : json["cityname"],
    statename: json["statename"] == null ? null : json["statename"],
    pinCode: json["pin_code"] == null ? null : json["pin_code"],
    bookingPujaDate: json["booking_puja_date"] == null ? null : json["booking_puja_date"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    completedAt: json["completed_at"] == null ? null : DateTime.parse(json["completed_at"]),
    bookingid: json["bookingid"] == null ? null : json["bookingid"],
    bookingStatus: json["booking_status"] == null ? null : json["booking_status"],
    totalEarning: json["total_earning"] == null ? null : json["total_earning"],
    hostname: json["hostname"] == null ? null : json["hostname"],
  );

  Map<String, dynamic> toJson() => {
    "pooja_title": poojaTitle == null ? null : poojaTitle,
    "pooja_date": poojaDate == null ? null : poojaDate,
    "address": address == null ? null : address,
    "country": country == null ? null : country,
    "cityname": cityname == null ? null : cityname,
    "statename": statename == null ? null : statename,
    "pin_code": pinCode == null ? null : pinCode,
    "booking_puja_date": bookingPujaDate == null ? null : bookingPujaDate,
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "completed_at": completedAt == null ? null : completedAt?.toIso8601String(),
    "bookingid": bookingid == null ? null : bookingid,
    "booking_status": bookingStatus == null ? null : bookingStatus,
    "total_earning": totalEarning == null ? null : totalEarning,
    "hostname": hostname == null ? null : hostname,
  };
}
