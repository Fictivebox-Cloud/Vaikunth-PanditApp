// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    required this.success,
    required this.message,
    required this.response,
  });

  bool success;
  String message;
  Response response;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
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
    required this.citylist,
  });

  List<Citylist> citylist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    citylist: List<Citylist>.from(json["citylist"].map((x) => Citylist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "citylist": List<dynamic>.from(citylist.map((x) => x.toJson())),
  };
}

class Citylist {
  Citylist({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Citylist.fromJson(Map<String, dynamic> json) => Citylist(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
