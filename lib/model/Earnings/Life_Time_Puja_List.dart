// To parse this JSON data, do
//
//     final lifeTimePujaListModel = lifeTimePujaListModelFromJson(jsonString);

import 'dart:convert';

LifeTimePujaListModel lifeTimePujaListModelFromJson(String str) => LifeTimePujaListModel.fromJson(json.decode(str));

String lifeTimePujaListModelToJson(LifeTimePujaListModel data) => json.encode(data.toJson());

class LifeTimePujaListModel {
  LifeTimePujaListModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory LifeTimePujaListModel.fromJson(Map<String, dynamic> json) => LifeTimePujaListModel(
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
    this.lifetimepujalist,
  });

  List<Lifetimepujalist> ?lifetimepujalist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    lifetimepujalist: json["lifetimepujalist"] == null ? null : List<Lifetimepujalist>.from(json["lifetimepujalist"].map((x) => Lifetimepujalist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "lifetimepujalist": lifetimepujalist == null ? null : List<dynamic>.from(lifetimepujalist!.map((x) => x.toJson())),
  };
}

class Lifetimepujalist {
  Lifetimepujalist({
    this.bookingPujaDate,
    this.totalEarning,
    this.hostname,
  });

  String? bookingPujaDate;
  int? totalEarning;
  String? hostname;

  factory Lifetimepujalist.fromJson(Map<String, dynamic> json) => Lifetimepujalist(
    bookingPujaDate: json["booking_puja_date"] == null ? null : json["booking_puja_date"],
    totalEarning: json["total_earning"] == null ? null : json["total_earning"],
    hostname: json["hostname"] == null ? null : json["hostname"],
  );

  Map<String, dynamic> toJson() => {
    "booking_puja_date": bookingPujaDate == null ? null : bookingPujaDate,
    "total_earning": totalEarning == null ? null : totalEarning,
    "hostname": hostname == null ? null : hostname,
  };
}
