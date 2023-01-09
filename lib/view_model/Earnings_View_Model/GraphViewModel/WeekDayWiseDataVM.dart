import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/repo/api_remote_services.dart';

import '../../../Util/Api_collection.dart';
import '../../../Util/login_in_User.dart';
import '../../../model/Earnings/Graph/WeeklyGraphModel.dart';



class WeekdataPerdayVM extends ChangeNotifier {
  bool _loading = false;
  WeekdataPerdayModel? _weekdataPerdayModel;
  UserError? _userError;

  bool get loading => _loading;

  WeekdataPerdayModel? get weekdataPerdayModel => _weekdataPerdayModel;

  UserError? get userError => _userError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setWeekdataPerdayModel(WeekdataPerdayModel weekdataPerdayModel) {
    _weekdataPerdayModel = weekdataPerdayModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
    notifyListeners();
  }

  WeekdataPerdayApicall() async {
    String userId = await LoggedInUserBloc.instance().getUserId();
    print("Pandit App = ${userId}");
    setLoading(true);
    Map<String, dynamic> data = {
     "pandit_id": userId,
     //"pandit_id": "7",


    };
    setLoading(true);


    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl: GET_WEEKDAYWISEDATA_API, apiData: data);
    if (response is Success) {
      Object data = weekdataPerdayModelFromJson(response.response as String);
      print("Govind Week data Per day ${response.response as String}");

      setWeekdataPerdayModel(data as WeekdataPerdayModel);
    } else if (response is Failure) {
      UserError userError =
      UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
