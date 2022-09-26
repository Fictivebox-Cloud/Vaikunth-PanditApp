import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/repo/api_remote_services.dart';

import '../../model/Login Model/city_model.dart';

import 'package:http/http.dart' as http;

class City_List_Api extends ChangeNotifier {

 bool _loading = false;
 CityModel? _cityModel;
 UserError? _userError;


 bool get loading => _loading;
 CityModel? get getCityModel => _cityModel;
 UserError? get userError => _userError;


 setLoading(bool loading){
  _loading = loading;
  notifyListeners();
 }

 setGetCityModel(CityModel cityModel){
  _cityModel = cityModel;
  notifyListeners();
 }
 setUserError(UserError userError){
  _userError =userError;
  notifyListeners();
 }
 String _searchKeyword = "";
 set searchKeyword(String value) {
  _searchKeyword = value;
 }

 getCityListApiCall() async{
  setLoading(true);
  var  response = await ApiRemoteServices.fechingGetApi(apiUrl: GET_CITYLIST_API,);


  if(response is Success){
   Object data = cityModelFromJson(response.response as String);
   setGetCityModel(data as CityModel);

  }
  else if(response is Failure){
   UserError userError = UserError(code: response.code,message: response.errorResponse);

   setUserError(userError);
  }
  setLoading(false);
 }

  }



