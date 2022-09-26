import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Booking Model/notification_model.dart';
import '../model/Booking Model/view_details_model.dart';

class NotificationVM with ChangeNotifier{
  bool _loading = false;
  NotificationModel? _notificationModel;
  UserError? _userError;

  bool get loading => _loading;
  NotificationModel? get notificationModel => _notificationModel;
  UserError? get userError => _userError;

  setLoading(loading){
    _loading = loading;
    notifyListeners();
  }

  setNotificationModel(NotificationModel notificationModel){
    _notificationModel=notificationModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = _userError;
    notifyListeners();
  }

  NotificationVM(){
    NotificationAPIcall();
  }

  NotificationAPIcall() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setLoading(true);
    String? userId = prefs.getString("pandit_id");
    var data={
      "pandit_id": userId,
    };

    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl:GET_NOTIFICATION_API,apiData: data);
    if(response is Success){
      Object data = notificationModelFromJson(response.response as String);

      setNotificationModel(data as NotificationModel);
      notifyListeners();
    }
    else if (response is Failure){
      UserError userError  =
      UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(loading);
  }

}