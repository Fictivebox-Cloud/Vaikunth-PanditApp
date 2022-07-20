// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  BookingModel({
    required this.success,
    required this.message,
    required this.response,
  });

  bool success;
  String message;
  Response response;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    success: json["success"],
    message: json["message"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "response": response.toJson(),
  };
}

class Response {
  Response({
    required this.bookinglist,
  });

  List<Bookinglist> bookinglist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    bookinglist: List<Bookinglist>.from(json["bookinglist"].map((x) => Bookinglist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bookinglist": List<dynamic>.from(bookinglist.map((x) => x.toJson())),
  };
}

class Bookinglist {
  Bookinglist({
    required this.id,
    required this.bookingId,
    required this.poojaTitle,
    required this.poojaDate,
    required this.address,
    required this.country,
    required this.cityname,
    required this.statename,
    required this.pinCode,
    required this.panditId,
    required this.bookingPujaDate,
    required this.time,
    required this.totalEarning,
    required this.hostname,
  });

  int id;
  int bookingId;
  String poojaTitle;
  String poojaDate;
  String address;
  Country? country;
  String cityname;
  String statename;
  int pinCode;
  int panditId;
  String bookingPujaDate;
  DateTime time;
  int totalEarning;
  String hostname;

  factory Bookinglist.fromJson(Map<String, dynamic> json) => Bookinglist(
    id: json["id"],
    bookingId: json["booking_id"],
    poojaTitle: json["pooja_title"],
    poojaDate: json["pooja_date"],
    address: json["address"],
    country: countryValues.map![json["country"]],
    cityname: json["cityname"],
    statename: json["statename"],
    pinCode: json["pin_code"],
    panditId: json["pandit_id"],
    bookingPujaDate: json["booking_puja_date"],
    time: DateTime.parse(json["time"]),
    totalEarning: json["total_earning"],
    hostname: json["hostname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_id": bookingId,
    "pooja_title": poojaTitle,
    "pooja_date": poojaDate,
    "address": address,
    "country": countryValues.reverse[country],
    "cityname": cityname,
    "statename": statename,
    "pin_code": pinCode,
    "pandit_id": panditId,
    "booking_puja_date": bookingPujaDate,
    "time": time.toIso8601String(),
    "total_earning": totalEarning,
    "hostname": hostname,
  };
}

enum Country { INDIA }

final countryValues = EnumValues({
  "India": Country.INDIA
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
