import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Util/login_in_User.dart';
import '../../model/Profile_Screen/Bank_Account Details/bank_list_model.dart';
import '../../model/Profile_Screen/Bank_Account Details/pandit_bank_list_model.dart';
import '../../model/Profile_Screen/Settings/help_support_details_model.dart';
import '../../model/Login Model/service_model.dart';

class HelpSupportDetails_VM with ChangeNotifier{
  bool _loading = false;
  HelpSupportDetailsModel? _helpSupportDetailsModel;
  UserError? _userError;

  bool get loading => _loading;
  HelpSupportDetailsModel? get helpSupportDetailsModel => _helpSupportDetailsModel;
  UserError? get userError => _userError;

  setLoading(loading){
    _loading = loading;
    notifyListeners();
  }

  setHelpSupportDetailsModel(HelpSupportDetailsModel helpSupportDetailsModel){
    _helpSupportDetailsModel = helpSupportDetailsModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = _userError;
    notifyListeners();
  }

  HelpSupportDetails_VM(){
    HelpSupportDetailsAPIcall();
  }

  HelpSupportDetailsAPIcall() async{
    String userId = await LoggedInUserBloc.instance().getUserId();
    setLoading(true);
    // String? userId = prefs.getString("pandit_id");
    var data={
      "pandit_id": userId,
    };

    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl:GET_GETHELP_API,apiData: data);
    if(response is Success){
      Object data = helpSupportDetailsModelFromJson(response.response as String);

      setHelpSupportDetailsModel(data as HelpSupportDetailsModel);
    }
    else if (response is Failure){
      UserError userError  =
      UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

}