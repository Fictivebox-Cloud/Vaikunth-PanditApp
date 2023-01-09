import 'package:flutter/cupertino.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Util/Api_collection.dart';
import '../../Util/login_in_User.dart';
import '../../model/Booking_View_Details/check_booking_otp_model.dart';

class CheckBookingConfirmOTPViewModel with ChangeNotifier {
  bool _loading = false;
  CheckBookingConfirmOtpModel? _bookingConfirmOtpModel;
  
  UserError? _userError;
  bool _valueReturn = false;

  bool get loading => _loading;
  bool get valueReturn => _valueReturn;
  CheckBookingConfirmOtpModel? get getcheckBookingConfirmOtpModel =>
      _bookingConfirmOtpModel;

  UserError? get userError => _userError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setGetCheckBookingConfirmOtpModel(
      CheckBookingConfirmOtpModel checkBookingConfirmOtpModel) {
    _bookingConfirmOtpModel = checkBookingConfirmOtpModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
    notifyListeners();
  }

  Future getCheckBookingConfirm(
      {required dynamic userBooking_id, otpcode}) async {
    setLoading(true);
    String userId = await LoggedInUserBloc.instance().getUserId();
    Map<String, dynamic> data = {
      "pandit_id": userId,
      "booking_id": userBooking_id.toString(),
      "code": otpcode
    };
    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl: GET_CHECK_BOOKING_OTP, apiData: data);
    if (response is Success) {
      print("DATA LOGIN${response.response}");
      Object data =
          checkBookingConfirmOtpModelFromJson(response.response as String);
      setGetCheckBookingConfirmOtpModel(data as CheckBookingConfirmOtpModel);
      _valueReturn =  true;
      print("value => ${valueReturn}");
      notifyListeners();
    } else if (response is Failure) {
      UserError userError =
          UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
      _valueReturn =  false;
      notifyListeners();
    }
    setLoading(false);
  }
}
