// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.success,
    this.message,
    this.response,
  });

  bool? success;
  String? message;
  Response? response;


  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
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
   this.citylist,
  });

  List<Citylist>? citylist;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    citylist: json["citylist"] == null ? null : List<Citylist>.from(json["citylist"].map((x) => Citylist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "citylist": citylist == null ? null : List<dynamic>.from(citylist!.map((x) => x.toJson())),
  };
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
