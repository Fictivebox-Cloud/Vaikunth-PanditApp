import 'package:flutter/material.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/repo/api_remote_services.dart';

import '../Util/Api_collection.dart';
import '../model/Login Model/Number_Verify_Model.dart';

class NumberVerifyViewModel with ChangeNotifier
{
  bool _loading = false;
  NumberVerifyModel? _numberVerifyModel;
  UserError? _userError;

  bool get loading => _loading;
  NumberVerifyModel? get numberverifyModel => _numberVerifyModel;
  UserError? get userError => _userError;

  setLoading(bool loading ){
    _loading = loading;
    notifyListeners();
  }
  setNumberVerifyModel(NumberVerifyModel numberVerifyModel){
    _numberVerifyModel = numberverifyModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = _userError;
    notifyListeners();
  }

  Future NumberVerifyAPIcall(String? mobile) async{
    setLoading(true);
    Map<String,dynamic> data ={
      "pandit_mobile": mobile
    };
    var response = await ApiRemoteServices.fechingGetApi(apiUrl: GET_NUMBER_VERIFY_API,apiData: data);
    if(response is Success){
      Object data = numberVerifyModelFromJson(response.response as String);
      print("Govind kumar${response.response as String}");
      setNumberVerifyModel(data as NumberVerifyModel);
      _numberVerifyModel = data as NumberVerifyModel;
      notifyListeners();
      return _numberVerifyModel!.response!.panditDetails != null;
    }
    else if(response is Failure){
      return false;
    }
    setLoading(false);
  }

}