class RegistrationResponseModel {
  bool? success;
  String? message;
  Response? response;

  RegistrationResponseModel({this.success, this.message, this.response});

  RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  bool? panditRegister;
  int? panditRegisterId;

  Response({this.panditRegister, this.panditRegisterId});

  Response.fromJson(Map<String, dynamic> json) {
    panditRegister = json['pandit_register'];
    panditRegisterId = json['pandit_register_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pandit_register'] = this.panditRegister;
    data['pandit_register_id'] = this.panditRegisterId;
    return data;
  }
}