import 'package:flutter/cupertino.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/model/Booking_View_Details/Booking_View_Details.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Util/Api_collection.dart';

class Puja_Confirm_OTP  with ChangeNotifier{
  bool _loading = false;
  PujaConfirmOtpModel? _puja_confirm_otp;
  UserError? _userError;


  bool get loading => _loading;
  PujaConfirmOtpModel? get getPujaConfirmModel => _puja_confirm_otp;
  UserError? get userError => _userError;

  setLoading(bool loading){
    _loading =loading;
    notifyListeners();

  }
  setGetPujaCofirmOTP(PujaConfirmOtpModel puja){
    _puja_confirm_otp = puja;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = userError;
    notifyListeners();
  }
  getPujaCofirmOtp( {required dynamic userBooking_id}) async{
    setLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("pandit_id");

    setLoading(true);
    Map<String , dynamic> data = {
      "pandit_id": userId,
      "booking_id": userBooking_id.toString()
      // "pandit_id": "7",


    };
    var response = await ApiRemoteServices.fechingGetApi(apiUrl: GET_SENDPUJAOTP_API,apiData: data);
    if(response is Success){

      Object data = pujaConfirmOtpModelFromJson(response.response as String);
      setGetPujaCofirmOTP(data as PujaConfirmOtpModel);

    }else if(response is Failure){
      UserError userError =UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);

  }

}