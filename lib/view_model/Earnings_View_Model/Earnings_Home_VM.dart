import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Util/login_in_User.dart';
import '../../model/Earnings/earnings_home_model.dart';

class Earnings_Home_VM with ChangeNotifier {
  bool _loading = false;
  EarningsHomeModel? _earningsHomeModel;
  UserError? _userError;

  bool get loading => _loading;

  EarningsHomeModel? get earningsHomeModel => _earningsHomeModel;

  UserError? get userError => _userError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setEarningsHomeModel(EarningsHomeModel earningsHomeModel) {
    _earningsHomeModel = earningsHomeModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = _userError;
    notifyListeners();
  }

  earningshomeAPIcall() async {
    setLoading(true);
    String userId = await LoggedInUserBloc.instance().getUserId();

    Map<String, dynamic> data = {
      "pandit_id": userId,
    };

    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl: GET_EARNINGSHOME_API, apiData: data);
    if (response is Success) {
      Object data = earningsHomeModelFromJson(response.response as String);

      setEarningsHomeModel(data as EarningsHomeModel);

    } else if (response is Failure) {
      UserError userError =
          UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
