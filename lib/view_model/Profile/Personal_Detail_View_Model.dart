import 'package:flutter/cupertino.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Util/Api_collection.dart';
import '../../Util/login_in_User.dart';
import '../../model/Profile_Screen/Personal_Detail_Model.dart';

class Personal_Detail_View_Model with ChangeNotifier{
  bool _loading = false;
  PersonalDetailModel? _detailModel;
  UserError? _userError;

  bool get loading => _loading;
  PersonalDetailModel? get presonalDetailModel => _detailModel;
  UserError? get userError =>_userError;

  setLoading(loading){
    _loading= _loading;
    notifyListeners();
  }
  setPersonalDetailModel(PersonalDetailModel personalDetailModel){
    _detailModel = personalDetailModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError =_userError;
    notifyListeners();

  }

  getpersonalDetailApiCall()async{
    setLoading(true);
    String userId = await LoggedInUserBloc.instance().getUserId();
    Map<String, dynamic>data={
      "pandit_id": userId,
    };
    var response = await ApiRemoteServices.fechingGetApi(apiUrl: GET_PERSONALDETAIL_API,apiData: data);
    if(response is Success){
      Object data = personalDetailModelFromJson(response.response as String);
      setPersonalDetailModel(data as PersonalDetailModel);

    }else if(response is Failure){
      UserError userError = UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);

    }
    setLoading(false);

  }

}