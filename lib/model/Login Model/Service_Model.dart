// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

ServiceModel serviceModelFromJson(String str) => ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  ServiceModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
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
    this.serviceslist,
  });

  List<Serviceslist>? serviceslist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    serviceslist: json["serviceslist"] == null ? null : List<Serviceslist>.from(json["serviceslist"].map((x) => Serviceslist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "serviceslist": serviceslist == null ? null : List<dynamic>.from(serviceslist!.map((x) => x.toJson())),
  };
}

class Serviceslist {
  Serviceslist({
    this.id,
    this.name,
    this.status,
  });

  int? id;
  String? name;
  String? status;

  factory Serviceslist.fromJson(Map<String, dynamic> json) => Serviceslist(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "status": status == null ? null : status,
  };
}
