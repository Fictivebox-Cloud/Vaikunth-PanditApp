import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Util/api_status.dart';
import '../../Util/Api_collection.dart';
import '../../consts/user_Error.dart';
import '../../model/Booking Model/BookingModel.dart';
import '../../repo/api_remote_services.dart';

class Booking_Request_View_Model with ChangeNotifier{

  bool _loading = false;
  GetBookingListModel? _getBookingListModel;
  UserError? _userError;
  
  

  Booking_Request_View_Model (){
    getbookingApiCall();
  }

  bool get loading => _loading;
  GetBookingListModel? get getbookinglistModel=> _getBookingListModel;
  UserError? get userError => _userError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
  setGetBookingModle(GetBookingListModel getBookingListModel2){
  _getBookingListModel = getBookingListModel2;
  notifyListeners();
  }
  setUserError(UserError userError) {
    _userError = userError;
    notifyListeners();
  }


getbookingApiCall() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setLoading(true);
  String? userId = prefs.getString("pandit_id");
  print("User Id $userId");
  Map<String, dynamic> data = {
    "pandit_id": userId
    // "pandit_id": "8"
  };
  var response  = await ApiRemoteServices.fechingGetApi(apiUrl: GET_BOOKING_LIST,apiData: data);
  if(response is Success){
    Object data = getBookingListModelFromJson(response.response as String);
    setGetBookingModle(data as GetBookingListModel);
  }else if(response is Failure) {
    UserError userError = UserError(code: response.code, message: response.errorResponse);
    setUserError(userError);
  }
  setLoading(false);

}


}