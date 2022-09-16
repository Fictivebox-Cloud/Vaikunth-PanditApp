import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../Util/Api_collection.dart';
import '../../model/Booking Model/Acept_Booking_Model.dart';
import 'booking_request_view_model.dart';


class Accept_Booking_Api extends ChangeNotifier{

  bool _loading = false;
  AcceptBookingModel? _acceptBookingModel;
  UserError? _userError;

  bool get loading => _loading;
  AcceptBookingModel? get acceptbookingApi => _acceptBookingModel;
  UserError? get userError => _userError;

  setLoading(bool loading){
    _loading =loading;
    notifyListeners();
  }

  setAcceptBookingModel(AcceptBookingModel acceptBookingModel1){
    _acceptBookingModel = acceptBookingModel1;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = userError;
    notifyListeners();
  }
  getAccept_booking_Api({required String userbooking})async{
    print("User booking $userbooking");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("pandit_id");
    print("Pandit App = ${userId}");
    setLoading(true);
    Map<String, dynamic> data = {
      "pandit_id": userId,
      "booking_id": userbooking
    };
    setLoading(true);

    var response = await ApiRemoteServices.fechingGetApi(apiUrl: GET_ACCEPTBOOKING_API,apiData: data);
    if(response is Success){
      print("Vikrant Kumar ${response.response}");
      Object data = acceptBookingModelFromJson(response.response as String);
      setAcceptBookingModel(data as AcceptBookingModel);
      //

    }else if(response is Failure){
      UserError userError = UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

}