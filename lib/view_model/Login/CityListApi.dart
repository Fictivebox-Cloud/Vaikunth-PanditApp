import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/repo/api_remote_services.dart';

import '../../model/Login Model/city_model.dart';

import 'package:http/http.dart' as http;

class CityListApi extends ChangeNotifier {

  bool _loading = false;
  bool _showCityList = false;
  UserError? _userError;
  Modelapi? _cityListModel;
  List<Citylist>? _cityList;

  bool get loading => _loading;
  bool get showCityList => _showCityList;
  UserError? get userError => _userError;
  Modelapi? get cityListModel => _cityListModel;
  List<Citylist>? get cityList => _cityList;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setCityListModel(Modelapi data) {
    _cityListModel = data;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
    notifyListeners();
  }

  setCityList(String? data) {
    if(data!.length > 2) {
      _showCityList = true;
      var value = data.capitalize;
      _cityList = cityListModel?.response?.citylist?.where((element) => element.name!.contains(value!)).toList();
      notifyListeners();
    } else {
      _showCityList = false;
      _cityList = [];
      notifyListeners();
    }
  }

  getCityListApiCall() async {
    setLoading(true);
    setCityList("");
    var response = await ApiRemoteServices.fechingGetApi(
      apiUrl: GET_CITYLIST_API,
    );
    if (response is Success) {
      Object data = modelapiFromJson(response.response as String);
      setCityListModel(data as Modelapi);
    } else if (response is Failure) {
      UserError userError =
          UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
