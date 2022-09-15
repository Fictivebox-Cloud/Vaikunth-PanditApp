// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
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
    this.noticationslist,
  });

  List<Noticationslist>? noticationslist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    noticationslist: json["noticationslist"] == null ? null : List<Noticationslist>.from(json["noticationslist"].map((x) => Noticationslist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "noticationslist": noticationslist == null ? null : List<dynamic>.from(noticationslist!.map((x) => x.toJson())),
  };
}

class Noticationslist {
  Noticationslist({
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
  });

  int? id;
  int? bookingId;
  String? poojaTitle;
  dynamic poojaDate;
  String? address;
  Country? country;
  String? cityname;
  String? statename;
  int? pinCode;
  int? panditId;
  String? bookingPujaDate;
  DateTime? time;

  factory Noticationslist.fromJson(Map<String, dynamic> json) => Noticationslist(
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
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "booking_id": bookingId == null ? null : bookingId,
    "pooja_title": poojaTitle == null ? null : poojaTitle,
    "pooja_date": poojaDate,
    "address": address == null ? null : address,
    "country": country == null ? null : countryValues.reverse![country],
    "cityname": cityname == null ? null : cityname,
    "statename": statename == null ? null : statename,
    "pin_code": pinCode == null ? null : pinCode,
    "pandit_id": panditId == null ? null : panditId,
    "booking_puja_date": bookingPujaDate == null ? null : bookingPujaDate,
    "time": time == null ? null : time?.toIso8601String(),
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
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
