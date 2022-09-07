import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/repo/api_remote_services.dart';

import '../Util/util.dart';
import '../model/Login Model/Login_Model.dart';
import '../model/Login Model/registration_model.dart';

class ApiCallLogin extends ChangeNotifier {
  bool _eventListStatus = false;
  bool _loading = false;

  bool get eventListStatus => _eventListStatus;
  RegistrationResponseModel? _registrationResponseModel;
  UserError? _userError;

  bool _dataStatus = false;

  bool get loading => _loading;

  RegistrationResponseModel? get loginListModel => _registrationResponseModel;

  bool get dataStatus => _dataStatus;

  UserError? get userError => _userError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(RegistrationResponseModel registrationResponseModele) {
    _registrationResponseModel = registrationResponseModele;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  Future fechingloginApi(
      {var mobile,
      var name,
      var services,
      var city,
      var aadharnumber,
      var pannumber,
      var account_number,
      var bank,
      var ifsc,
      File? photo,
      File? aadharfrontphoto,
      File? aadharbackphoto,
      File? panfile,
      String? apiUrl}) async {
    setLoading(true);

    Map<String, String> map = Map<String, String>();

    map['pandit_mobile'] = mobile.toString();
    map['pandit_name'] = name;
    map['pandit_services'] = services;
    map['pandit_city'] = city;
    map['pandit_aadhar_number'] = aadharnumber.toString();
    map['pandit_pan_number'] = pannumber.toString();
    map['pandit_account_number'] = account_number.toString();
    map['pandit_bank'] = bank;
    map['pandit_ifsc'] = ifsc;

    print(map);
    String body = json.encode(map);
    var url = Uri.parse(apiUrl!);
    var response =
        await ApiRemoteServices.fechingGetApi(apiUrl: GET_LOGIN_API)
            .timeout(Duration(seconds: 15));

    var request = http.MultipartRequest('POST', url);
    request.fields.addAll(map);

    debugPrint('#### Image: ${photo?.path}');
    debugPrint('#### AadharFont: ${aadharfrontphoto?.path}');
    debugPrint('#### AadharBack: ${aadharbackphoto?.path}');
    debugPrint('#### Pan: ${panfile?.path}');
    request.files.add(
      await http.MultipartFile.fromPath('pandit_image', photo!.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath(
          'pandit_aadhar_front', aadharfrontphoto!.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath(
          'pandit_aadhar_back', aadharbackphoto!.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath('pandit_pan_file', panfile!.path),
    );
    var result = await request.send();
    print("res${result}");

    if (response is Success) {
      Object data = loginModelFromJson(response.response as String);
      setUserListModel(data as RegistrationResponseModel);
    } else if (response is Failure) {
      UserError userError =
          UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
