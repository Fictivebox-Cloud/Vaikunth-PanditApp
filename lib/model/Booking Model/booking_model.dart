// To parse this JSON data, do
//
//     final getBookingListModel = getBookingListModelFromJson(jsonString);

import 'dart:convert';

GetBookingListModel getBookingListModelFromJson(String str) => GetBookingListModel.fromJson(json.decode(str));

String getBookingListModelToJson(GetBookingListModel data) => json.encode(data.toJson());

class GetBookingListModel {
  GetBookingListModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory GetBookingListModel.fromJson(Map<String, dynamic> json) => GetBookingListModel(
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
    this.bookinglist,
  });

  List<Bookinglist>? bookinglist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    bookinglist: json["bookinglist"] == null ? null : List<Bookinglist>.from(json["bookinglist"].map((x) => Bookinglist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bookinglist": bookinglist == null ? null : List<dynamic>.from(bookinglist!.map((x) => x.toJson())),
  };
}

class Bookinglist {
  Bookinglist({
    this.id,
    this.bookingId,
    this.poojaTitle,
    this.poojaDate,
    this.address,
    this.country,
    this.cityname,
    this.statename,
    this.pinCode,
    this.panditId,
    this.bookingPujaDate,
    this.time,
    this.totalEarning,
    this.hostname,
  });

  int? id;
  int? bookingId;
  String? poojaTitle;
  dynamic? poojaDate;
  String? address;
  Country? country;
  String? cityname;
  String? statename;
  int? pinCode;
  int? panditId;
  String? bookingPujaDate;
  DateTime? time;
  int? totalEarning;
  String? hostname;

  factory Bookinglist.fromJson(Map<String, dynamic> json) => Bookinglist(
    id: json["id"] == null ? null : json["id"],
    bookingId: json["booking_id"] == null ? null : json["booking_id"],
    poojaTitle: json["pooja_title"] == null ? null : json["pooja_title"],
    poojaDate: json["pooja_date"],
    address: json["address"] == null ? null : json["address"],
    country: json["country"] == null ? null : countryValues.map![json["country"]],
    cityname: json["cityname"] == null ? null : json["cityname"],
    statename: json["statename"] == null ? null : json["statename"],
    pinCode: json["pin_code"] == null ? null : json["pin_code"],
    panditId: json["pandit_id"] == null ? null : json["pandit_id"],
    bookingPujaDate: json["booking_puja_date"] == null ? null : json["booking_puja_date"],
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    totalEarning: json["total_earning"] == null ? null : json["total_earning"],
    hostname: json["hostname"] == null ? null : json["hostname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "booking_id": bookingId == null ? null : bookingId,
    "pooja_title": poojaTitle == null ? null : poojaTitle,
    "pooja_date": poojaDate,
    "address": address == null ? null : address,
    "country": country == null ? null : countryValues.reverse[country],
    "cityname": cityname == null ? null : cityname,
    "statename": statename == null ? null : statename,
    "pin_code": pinCode == null ? null : pinCode,
    "pandit_id": panditId == null ? null : panditId,
    "booking_puja_date": bookingPujaDate == null ? null : bookingPujaDate,
    "time": time == null ? null : time!.toIso8601String(),
    "total_earning": totalEarning == null ? null : totalEarning,
    "hostname": hostname == null ? null : hostname,
  };
}

enum Country { INDIA }

final countryValues = EnumValues({
  "India": Country.INDIA
});

enum PoojaDateEnum { THE_00000000 }

final poojaDateEnumValues = EnumValues({
  "0000-00-00": PoojaDateEnum.THE_00000000
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
