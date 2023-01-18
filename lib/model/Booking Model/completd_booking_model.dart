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
    "response": response == null ? null : response?.toJson(),
  };
}

class Response {
  Response({
    this.compbookinglist,
    this.upcomingbookinglist,
    this.cancelbookinglist,
  });

  List<Compbookinglist>? compbookinglist;
  List<Upcomingbookinglist>? upcomingbookinglist;
  List<Cancelbookinglist>? cancelbookinglist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    compbookinglist: json["compbookinglist"] == null ? null : List<Compbookinglist>.from(json["compbookinglist"].map((x) => Compbookinglist.fromJson(x))),
    upcomingbookinglist: json["upcomingbookinglist"] == null ? null : List<Upcomingbookinglist>.from(json["upcomingbookinglist"].map((x) => Upcomingbookinglist.fromJson(x))),
    cancelbookinglist: json["cancelbookinglist"] == null ? null : List<Cancelbookinglist>.from(json["cancelbookinglist"].map((x) => Cancelbookinglist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "compbookinglist": compbookinglist == null ? null : List<Compbookinglist>.from(compbookinglist!.map((x) => x.toJson())),
    "upcomingbookinglist": upcomingbookinglist == null ? null : List<Upcomingbookinglist>.from(upcomingbookinglist!.map((x) => x.toJson())),
    "cancelbookinglist": cancelbookinglist == null ? null : List<Cancelbookinglist>.from(cancelbookinglist!.map((x) => x.toJson())),
  };
}

class Cancelbookinglist {
  Cancelbookinglist({
    this.id,
    this.orderId,
    this.name,
    this.poojaTitle,
    this.bookingPaidAmount,
    this.bookingPujaDate,
    this.updatedAt,
    this.activity,
  });

  int? id;
  String? orderId;
  String? name;
  String? poojaTitle;
  int? bookingPaidAmount;
  String? bookingPujaDate;
  DateTime? updatedAt;
  String? activity;

  factory Cancelbookinglist.fromJson(Map<String, dynamic> json) => Cancelbookinglist(
    id: json["id"] == null ? null : json["id"],
    orderId: json["order_id"] == null ? null : json["order_id"],
    name: json["name"] == null ? null : json["name"],
    poojaTitle: json["pooja_title"] == null ? null : json["pooja_title"],
    bookingPaidAmount: json["booking_paid_amount"] == null ? null : json["booking_paid_amount"],
    bookingPujaDate: json["booking_puja_date"] == null ? null : json["booking_puja_date"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    activity: json["activity"] == null ? null : json["activity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "order_id": orderId == null ? null : orderId,
    "name": name == null ? null : name,
    "pooja_title": poojaTitle == null ? null : poojaTitle,
    "booking_paid_amount": bookingPaidAmount == null ? null : bookingPaidAmount,
    "booking_puja_date": bookingPujaDate == null ? null : bookingPujaDate,
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "activity": activity == null ? null : activity,
  };
}

class Compbookinglist {
  Compbookinglist({
    this.orderId,
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

  String? orderId;
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
    orderId: json["order_id"] == null ? null : json["order_id"],
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
    "order_id": orderId == null ? null : orderId,
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

class Upcomingbookinglist {
  Upcomingbookinglist({
    this.id,
    this.orderId,
    this.bookingPaymenttype,
    this.bookingPaidAmount,
    this.bookingRemainingTransactionId,
    this.poojaTitle,
    this.poojaDate,
    this.address,
    this.country,
    this.cityname,
    this.pinCode,
    this.bookingPanditId,
    this.bookingPujaDate,
    this.assignStatus,
    this.pujaMode,
    this.name,
    this.email,
    this.phone,
  });

  int? id;
  String? orderId;
  String? bookingPaymenttype;
  int? bookingPaidAmount;
  int? bookingRemainingTransactionId;
  String? poojaTitle;
  String? poojaDate;
  String? address;
  String? country;
  String? cityname;
  int? pinCode;
  int? bookingPanditId;
  String? bookingPujaDate;
  String? assignStatus;
  String? pujaMode;
  String? name;
  String? email;
  String? phone;

  factory Upcomingbookinglist.fromJson(Map<String, dynamic> json) => Upcomingbookinglist(
    id: json["id"] == null ? null : json["id"],
    orderId: json["order_id"] == null ? null : json["order_id"],
    bookingPaymenttype: json["booking_paymenttype"] == null ? null : json["booking_paymenttype"],
    bookingPaidAmount: json["booking_paid_amount"] == null ? null : json["booking_paid_amount"],
    bookingRemainingTransactionId: json["booking_remaining_transaction_id"] == null ? null : json["booking_remaining_transaction_id"],
    poojaTitle: json["pooja_title"] == null ? null : json["pooja_title"],
    poojaDate: json["pooja_date"] == null ? null : json["pooja_date"],
    address: json["address"] == null ? null : json["address"],
    country: json["country"] == null ? null : json["country"],
    cityname: json["cityname"] == null ? null : json["cityname"],
    pinCode: json["pin_code"] == null ? null : json["pin_code"],
    bookingPanditId: json["booking_pandit_id"] == null ? null : json["booking_pandit_id"],
    bookingPujaDate: json["booking_puja_date"] == null ? null : json["booking_puja_date"],
    assignStatus: json["assign_status"] == null ? null : json["assign_status"],
    pujaMode: json["puja_mode"] == null ? null : json["puja_mode"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "order_id": orderId == null ? null : orderId,
    "booking_paymenttype": bookingPaymenttype == null ? null : bookingPaymenttype,
    "booking_paid_amount": bookingPaidAmount == null ? null : bookingPaidAmount,
    "booking_remaining_transaction_id": bookingRemainingTransactionId == null ? null : bookingRemainingTransactionId,
    "pooja_title": poojaTitle == null ? null : poojaTitle,
    "pooja_date": poojaDate == null ? null : poojaDate,
    "address": address == null ? null : address,
    "country": country == null ? null : country,
    "cityname": cityname == null ? null : cityname,
    "pin_code": pinCode == null ? null : pinCode,
    "booking_pandit_id": bookingPanditId == null ? null : bookingPanditId,
    "booking_puja_date": bookingPujaDate == null ? null : bookingPujaDate,
    "assign_status": assignStatus == null ? null : assignStatus,
    "puja_mode": pujaMode == null ? null : pujaMode,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
  };
}
