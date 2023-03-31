import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/repo/api_remote_services.dart';

import '../../Util/Api_collection.dart';
import '../../Util/getHeader.dart';
import '../../model/Login Model/number_verify_model.dart';
import '../../model/Login Model/register_response_model.dart';

class NumberVerifyViewModel with ChangeNotifier {
  bool _loading = false;
  NumberVerifyModel? _numberVerifyModel;
  RegisterResponseModel? _registerResponseModel;
  UserError? _userError;

  bool get loading => _loading;
  NumberVerifyModel? get numberverifyModel => _numberVerifyModel;
  RegisterResponseModel? get registerResponseModel => _registerResponseModel;
  UserError? get userError => _userError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setNumberVerifyModel(NumberVerifyModel numberVerifyModel) {
    _numberVerifyModel = numberverifyModel;
    notifyListeners();
  }

  setRegistrationModel(RegisterResponseModel registerResponseModel) {
    _numberVerifyModel = numberverifyModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = _userError;
    notifyListeners();
  }

  Future NumberVerifyAPIcall(
      String? mobile, String? code, String? resendOTPFlag) async {
    setLoading(true);
    Map<String, dynamic> data = {
      "pandit_mobile": mobile,
      "code": code,
      "resend": resendOTPFlag
    };
    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl: GET_NUMBER_VERIFY_API, apiData: data);
    if (response is Success) {
      Object data = numberVerifyModelFromJson(response.response as String);

      setNumberVerifyModel(data as NumberVerifyModel);
      _numberVerifyModel = data as NumberVerifyModel;

      notifyListeners();
      return _numberVerifyModel;
    } else if (response is Failure) {
      return _numberVerifyModel;
      //false;
    }
    setLoading(false);
  }

  Future<RegisterResponseModel> sendOtp(String? mobile) async {
    setLoading(true);
    Map<String, dynamic> data = {
      "pandit_mobile": mobile,
      "pandit_name": "",
      "pandit_image": "",
      "pandit_services": " ",
    };
    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl: GET_LOGIN_API, apiData: data);
    // RegisterResponseModel data1 =
    //     RegisterResponseModel.fromJson(jsonDecode(response.toString()));
    if (response is Success) {
      Object data = registerResponseModelFromJson(response.response as String);

      // setNumbserVerifyModel(data as NumberVerifyModel);
      // _numberVerifyModel = data as NumberVerifyModel;
      setRegistrationModel(data as RegisterResponseModel);
      _registerResponseModel = data as RegisterResponseModel;

      notifyListeners();
      return _registerResponseModel ?? RegisterResponseModel(response: null);
      //_numberVerifyModel!.response!.panditDetails != null;
    } else if (response is Failure) {
      return _registerResponseModel ?? RegisterResponseModel(response: null);
      //false;
    }
    setLoading(false);

    return _registerResponseModel ?? RegisterResponseModel(response: null);
  }
}
