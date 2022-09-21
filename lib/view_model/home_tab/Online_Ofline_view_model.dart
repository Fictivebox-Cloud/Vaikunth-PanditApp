


import 'package:flutter/cupertino.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/model/Booking%20Model/Online_Ofline_Model.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Util/Api_collection.dart';

class Online_Ofline_View_Model extends ChangeNotifier{

  bool _loading = false;
  OnlineOflineModel? _getonlineOflineModel;
  UserError? _userError;



  bool get loading => _loading;
  OnlineOflineModel? get  getOnlineOfline => _getonlineOflineModel;
  UserError? get userError =>_userError;

  setLoading(bool loading){
    _loading = loading;
    notifyListeners();
  }

  setOnlineOfline(OnlineOflineModel onlineOflineModel){
    _getonlineOflineModel = onlineOflineModel;
    notifyListeners();
  }

  setUserError(UserError userError){
    _userError =userError;
    notifyListeners();
  }


  getonlineofline({ required String userStatus}) async{

    setLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("pandit_id");

    Map<String , dynamic> data ={
      "pandit_id": userId,
      "status": userStatus
    };
    var response = await ApiRemoteServices.fechingGetApi(apiUrl: GET_ONLINE_OFLINE_API,apiData: data);
    if(response is Success){

      Object data = onlineOflineModelFromJson(response.response as String);
      setOnlineOfline(data as OnlineOflineModel );
    }else if (response is Failure){
      UserError userError = UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);

  }
}