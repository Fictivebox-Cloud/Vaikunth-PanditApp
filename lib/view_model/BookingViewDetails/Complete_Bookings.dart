import 'package:flutter/material.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/model/Booking%20Model/Completd_Booking_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Util/Api_collection.dart';
import '../../Util/api_status.dart';
import '../../Util/login_in_User.dart';
import '../../repo/api_remote_services.dart';

class CompleteBookingViewModel with ChangeNotifier {
  bool _loading = false;
  Completebokingmodel? _completebokingmodel;
  UserError? _userError;

  bool get loading => _loading;

  Completebokingmodel? get completebokingmodel => _completebokingmodel;

  UserError? get userError => _userError;

  CompleteBookingViewModel() {
    completebookingAPIcall();
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setCompletebokingmodel(Completebokingmodel completebokingmodel) {
    _completebokingmodel = completebokingmodel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
    notifyListeners();
  }

  completebookingAPIcall() async {
    String userId = await LoggedInUserBloc.instance().getUserId();
    setLoading(true);
    // String? userId = prefs.getString("pandit_id");
    var data = {
      "pandit_id": userId
      // "pandit_id": "8"
    };

    var respones = await ApiRemoteServices.fechingGetApi(
        apiUrl: GET_COMPLETEBOOKING_API, apiData: data);
    if (respones is Success) {
      Object data = completebokingmodelFromJson(respones.response as String);
      setCompletebokingmodel(data as Completebokingmodel);
    } else if (respones is Failure) {
      UserError userError =
      UserError(code: respones.code, message: respones.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}