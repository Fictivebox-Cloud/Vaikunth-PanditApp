import 'package:flutter/cupertino.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/model/Booking_View_Details/Booking_View_Details.dart';
import 'package:panditapp/repo/api_remote_services.dart';

import '../../Util/Api_collection.dart';

class Puja_Confirm_OTP  with ChangeNotifier{
  bool _loading = false;
  PujaConfirmOtpModel? _puja_confirm_otp;
  UserError? _userError;

  Booking_View_Model(){
    getPujaCofirmOtp();
  }

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
  getPujaCofirmOtp() async{
    setLoading(true);
    Map<String , dynamic> data = {

      "pandit_id": "7",
      "booking_id": "727"

    };
    var response = await ApiRemoteServices.fechingGetApi(apiUrl: GET_SENDPUJAOTP_API,apiData: data);
    if(response is Success){
      print("Vikrant Puja OTP${response.response}");
      Object data = pujaConfirmOtpModelFromJson(response.response as String);
      setGetPujaCofirmOTP(data as PujaConfirmOtpModel);

    }else if(response is Failure){
      UserError userError =UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);

  }

}