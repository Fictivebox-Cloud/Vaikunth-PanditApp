// To parse this JSON data, do
//
//     final viewDetailModel = viewDetailModelFromJson(jsonString);

import 'dart:convert';

ViewDetailModel viewDetailModelFromJson(String str) => ViewDetailModel.fromJson(json.decode(str));

String viewDetailModelToJson(ViewDetailModel data) => json.encode(data.toJson());

class ViewDetailModel {
  ViewDetailModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory ViewDetailModel.fromJson(Map<String, dynamic> json) => ViewDetailModel(
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
    this.viewdetaildata,
  });

  List<Viewdetaildatum>? viewdetaildata;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    viewdetaildata: json["viewdetaildata"] == null ? null : List<Viewdetaildatum>.from(json["viewdetaildata"].map((x) => Viewdetaildatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "viewdetaildata": viewdetaildata == null ? null : List<dynamic>.from(viewdetaildata!.map((x) => x.toJson())),
  };
}

class Viewdetaildatum {
  Viewdetaildatum({
    this.id,
    this.bookingId,
    this.poojaTitle,
    this.poojaDate,
    this.address,
    this.country,
    this.statename,
    this.cityname,
    this.pinCode,
    this.panditId,
    this.bookingPujaDate,
    this.bookingPaidAmount,
    this.orderId,
    this.pujaMode,
    this.pujaLanguage,
    this.pujaDuration,
    this.name,
    this.email,
    this.phone,
    this.sbdetail,
  });

  int? id;
  int? bookingId;
  String? poojaTitle;
  String? poojaDate;
  dynamic address;
  String? country;
  String? statename;
  String? cityname;
  int? pinCode;
  int? panditId;
  String? bookingPujaDate;
  int? bookingPaidAmount;
  String? orderId;
  String? pujaMode;
  String? pujaLanguage;
  String? pujaDuration;
  String? name;
  String? email;
  String? phone;
  List<dynamic>? sbdetail;

  factory Viewdetaildatum.fromJson(Map<String, dynamic> json) => Viewdetaildatum(
    id: json["id"] == null ? null : json["id"],
    bookingId: json["booking_id"] == null ? null : json["booking_id"],
    poojaTitle: json["pooja_title"] == null ? null : json["pooja_title"],
    poojaDate: json["pooja_date"] == null ? null : json["pooja_date"],
    address: json["address"],
    country: json["country"] == null ? null : json["country"],
    statename: json["statename"] == null ? null : json["statename"],
    cityname: json["cityname"] == null ? null : json["cityname"],
    pinCode: json["pin_code"] == null ? null : json["pin_code"],
    panditId: json["pandit_id"] == null ? null : json["pandit_id"],
    bookingPujaDate: json["booking_puja_date"] == null ? null : json["booking_puja_date"],
    bookingPaidAmount: json["booking_paid_amount"] == null ? null : json["booking_paid_amount"],
    orderId: json["order_id"] == null ? null : json["order_id"],
    pujaMode: json["puja_mode"] == null ? null : json["puja_mode"],
    pujaLanguage: json["puja_language"] == null ? null : json["puja_language"],
    pujaDuration: json["puja_duration"] == null ? null : json["puja_duration"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    sbdetail: json["sbdetail"] == null ? null : List<dynamic>.from(json["sbdetail"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "booking_id": bookingId == null ? null : bookingId,
    "pooja_title": poojaTitle == null ? null : poojaTitle,
    "pooja_date": poojaDate == null ? null : poojaDate,
    "address": address,
    "country": country == null ? null : country,
    "statename": statename == null ? null : statename,
    "cityname": cityname == null ? null : cityname,
    "pin_code": pinCode == null ? null : pinCode,
    "pandit_id": panditId == null ? null : panditId,
    "booking_puja_date": bookingPujaDate == null ? null : bookingPujaDate,
    "booking_paid_amount": bookingPaidAmount == null ? null : bookingPaidAmount,
    "order_id": orderId == null ? null : orderId,
    "puja_mode": pujaMode == null ? null : pujaMode,
    "puja_language": pujaLanguage == null ? null : pujaLanguage,
    "puja_duration": pujaDuration == null ? null : pujaDuration,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "sbdetail": sbdetail == null ? null : List<dynamic>.from(sbdetail!.map((x) => x)),
  };
}
