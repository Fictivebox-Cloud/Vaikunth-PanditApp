import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Util/Api_collection.dart';
import '../../Util/login_in_User.dart';
import '../../model/Booking Model/Reject_Booking_Model.dart';


class Reject_Booking_VM extends ChangeNotifier {
  bool _loading = false;
  RejectBookingModel? _rejectBookingModel;
  UserError? _userError;

  bool get loading => _loading;

  RejectBookingModel? get rejectBookingModel => _rejectBookingModel;

  UserError? get userError => _userError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setRejectBookingModel(RejectBookingModel rejectBookingModel) {
    _rejectBookingModel = rejectBookingModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
    notifyListeners();
  }

    Reject_booking_Apicall({required String userbooking}) async {
    String userId = await LoggedInUserBloc.instance().getUserId();
    print("Pandit App = ${userId}");
    setLoading(true);
    Map<String, dynamic> data = {
      "pandit_id": userId,
      "booking_id": userbooking
    };
    setLoading(true);
    print("userbooking :> $userbooking");

    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl: GET_REJECTBOOKING_API, apiData: data);
    if (response is Success) {
      Object data = rejectBookingModelFromJson(response.response as String);
      print("Govind reject Booking  ${response.response as String}");

      setRejectBookingModel(data as RejectBookingModel);
    } else if (response is Failure) {
      UserError userError =
      UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}
