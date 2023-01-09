import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Util/Api_collection.dart';
import '../../Util/login_in_User.dart';
import '../../model/Profile_Screen/Edit_Profile/edit_profile.dart';

class EditProfileViewModel with ChangeNotifier{

  bool _loading = false;
  EditDetailsModel? _editDetailsModel;
  UserError? _userError;

  bool get loading => _loading;
  EditDetailsModel? get getEditDetailsModel => _editDetailsModel;
  UserError? get userError => _userError;

  setLoading(bool loading){
    _loading =loading;
    notifyListeners();
  }


  setEditDetailsModel(EditDetailsModel editDetailsModel){
    _editDetailsModel = editDetailsModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = userError;
    notifyListeners();
  }
  fachingEditDetailsModel(
      {var pandit_name, var pandit_services, var pandit_city})async{
    String userId = await LoggedInUserBloc.instance().getUserId();
    setLoading(true);
    // String? userId = prefs.getString("pandit_id");
    var data={
      "pandit_id": userId,
      'pandit_name': pandit_name,
      'pandit_services':pandit_services,
      'pandit_city': pandit_city
    };



    var response = await ApiRemoteServices.fechingGetApi(
      apiUrl:GET_UPDATEPROFILE_API,apiData: data,

    );

    if(response is Success){
      Object data = editDetailsModelFromJson(response.response as String);

      setEditDetailsModel(data as EditDetailsModel);
    }
    else if(response is Failure){
       UserError(code:  response.code,message: response.errorResponse);
    }
    setLoading(false);

  }


}