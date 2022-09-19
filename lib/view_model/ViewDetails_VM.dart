import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Booking Model/ViewDetailsModel.dart';

class ViewDetailVM with ChangeNotifier{
  bool _loading = false;
  ViewDetailModel? _viewDetailModel;
  UserError? _userError;

  bool get loading => _loading;
  ViewDetailModel? get viewdetailmodel => _viewDetailModel;
  UserError? get userError => _userError;

  setLoading(loading){
    _loading = loading;
    notifyListeners();
  }

  setViewViewDetailModel(ViewDetailModel viewDetailModel){
    _viewDetailModel=viewDetailModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = _userError;
    notifyListeners();
  }

  // ViewDetailVM(){
  //   viewdetailAPIcall({required String userbooking}, userbooking: '');
  // }

viewdetailAPIcall( {required dynamic userbooking}) async{
    setLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("pandit_id");
    print("Pandit App = ${userId}");
    Map<String , dynamic> data={
      "pandit_id": userId,
      "booking_id": userbooking.toString()
             };

    var response = await ApiRemoteServices.fechingGetApi(
      apiUrl:GET_VIEWDETAIL_API,apiData: data);
    if(response is Success){
      Object data = viewDetailModelFromJson(response.response as String);
      print("Govind kumar${response.response as String}");
      setViewViewDetailModel(data as ViewDetailModel);
    }
    else if (response is Failure){
      UserError userError  =
          UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
}

}