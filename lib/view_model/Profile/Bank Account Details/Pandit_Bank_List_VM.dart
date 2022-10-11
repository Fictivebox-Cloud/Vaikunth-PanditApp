import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Util/login_in_User.dart';
import '../../../model/Profile_Screen/Bank_Account Details/bank_list_model.dart';
import '../../../model/Profile_Screen/Bank_Account Details/pandit_bank_list_model.dart';
import '../../../model/Login Model/service_model.dart';

class PanditBankListVM with ChangeNotifier{
  bool _loading = false;
  PanditBankListModel? _panditBankListModel;
  UserError? _userError;

  bool get loading => _loading;
  PanditBankListModel? get panditBankListModel => _panditBankListModel;
  UserError? get userError => _userError;

  setLoading(loading){
    _loading = loading;
    notifyListeners();
  }

  setPanditBankListModel(PanditBankListModel panditBankListModel){
    _panditBankListModel = panditBankListModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = _userError;
    notifyListeners();
  }

  PanditBankListVM(){
    panditbankListAPIcall();
  }

  panditbankListAPIcall() async{
    String userId = await LoggedInUserBloc.instance().getUserId();
    setLoading(true);
    // String? userId = prefs.getString("pandit_id");
    var data={
       "pandit_id": userId,
    };

    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl:GET_GETPANDITBANKLIST_API,apiData: data);
    if(response is Success){
      Object data = panditBankListModelFromJson(response.response as String);
      print("Govind pandit Bank list${response.response as String}");
      setPanditBankListModel(data as PanditBankListModel);
    }
    else if (response is Failure){
      UserError userError  =
      UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

}