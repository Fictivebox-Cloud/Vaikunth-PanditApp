import 'package:flutter/material.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/model/Booking%20Model/Completd_Booking_Model.dart';

import '../Util/Api_collection.dart';
import '../Util/api_status.dart';
import '../repo/api_remote_services.dart';

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
    setLoading(true);
    var data = {"pandit_id": "81"};

    var respones = await ApiRemoteServices.fechingGetApi(
        apiUrl: GET_COMPLETEBOOKING_API, apiData: data);
    if (respones is Success) {
      Object data = completebokingmodelFromJson(respones.response as String);
      print("Govind kumar${respones.response as String}");
      setCompletebokingmodel(data as Completebokingmodel);
    } else if (respones is Failure) {
      UserError userError =
          UserError(code: respones.code, message: respones.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
