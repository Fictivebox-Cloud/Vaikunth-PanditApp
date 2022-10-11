// To parse this JSON data, do
//
//     final modelapi = modelapiFromJson(jsonString);

import 'dart:convert';

Modelapi modelapiFromJson(String str) => Modelapi.fromJson(json.decode(str));

String modelapiToJson(Modelapi data) => json.encode(data.toJson());

class Modelapi {
  Modelapi({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;

  factory Modelapi.fromJson(Map<String, dynamic> json) => Modelapi(
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
    this.citylist,
  });

  List<Citylist>? citylist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    citylist: json["citylist"] == null ? null : List<Citylist>.from(json["citylist"].map((x) => Citylist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "citylist": citylist == null ? null : List<dynamic>.from(citylist!.map((x) => x.toJson())),
  };

  where(Function(dynamic element) param0) {}
}

class Citylist {
  Citylist({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Citylist.fromJson(Map<String, dynamic> json) => Citylist(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}
