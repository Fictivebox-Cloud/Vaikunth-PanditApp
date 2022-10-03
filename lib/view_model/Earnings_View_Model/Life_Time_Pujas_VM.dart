import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Util/login_in_User.dart';
import '../../model/Earnings/Life_Time_Puja_List.dart';
import '../../model/Earnings/earnings_home_model.dart';

class Life_Time_Puja_List_VM with ChangeNotifier {
  bool _loading = false;
  LifeTimePujaListModel? _lifeTimePujaListModel;
  UserError? _userError;

  bool get loading => _loading;

  LifeTimePujaListModel? get lifeTimePujaListModel => _lifeTimePujaListModel;

  UserError? get userError => _userError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setLifeTimePujaListModel(LifeTimePujaListModel lifeTimePujaListModel) {
    _lifeTimePujaListModel = lifeTimePujaListModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = _userError;
    notifyListeners();
  }
  lifetimepujaAPIcall() async {
  //lifetimepujaAPIcall() async {
    setLoading(true);
    String userId = await LoggedInUserBloc.instance().getUserId();

    Map<String, dynamic> data = {
     // "pandit_id": userId,
      "pandit_id": "7"

    };

    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl: GET_LIFETIMEPUJA_API, apiData: data);
    if (response is Success) {
      Object data = lifeTimePujaListModelFromJson(response.response as String);
      print("Govind LIFE TIME PUJA LIST ${response.response as String}");

      setLifeTimePujaListModel(data as LifeTimePujaListModel);

    } else if (response is Failure) {
      UserError userError =
      UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
