import 'dart:convert';

class User {
  int? userId;
  String? moblie;
  String? city;
  String? service;


  User(
   this.userId,
      this.city,
      this.moblie,
      this.service
      );
  User.fromJson(Map<String, dynamic> json){
    if (json['pandit_id'] != null) this.userId = int.parse(json['pandit_id'].toString());
    if (json['pandit_moblie'] != null) this.moblie = json['pandit_moblie'].toString();
    if (json['city'] != null) this.city = json['city'].toString();
    if (json['service'] != null) this.service = json['service'].toString();
  }
  Map<String, dynamic> toJson(){
return{
    'pandit_id':userId,
     'pandit_moblie':moblie,



};

  }
  @override
  String toString() {
    return jsonEncode(toJson());
  }


}