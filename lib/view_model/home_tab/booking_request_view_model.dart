import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Util/api_status.dart';
import '../../Util/Api_collection.dart';
import '../../Util/login_in_User.dart';
import '../../consts/user_Error.dart';
import '../../model/Booking Model/booking_model.dart';
import '../../repo/api_remote_services.dart';

class Booking_Request_View_Model with ChangeNotifier{

  bool _loading = false;
  GetBookingListModel? _getBookingListModel;
  UserError? _userError;
  bool _isRejectBooking = false;
  

  Booking_Request_View_Model (){
    getbookingApiCall(true);
    notifyListeners();
  }

  bool get loading => _loading;
  GetBookingListModel? get getbookinglistModel=> _getBookingListModel;
  UserError? get userError => _userError;
  bool get isRejectBooking => _isRejectBooking;

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

  setRejectBooking(bool data) {
    _isRejectBooking = !data;
    print("_isRejectBooking $_isRejectBooking");
    notifyListeners();
  }

getbookingApiCall( bool reload) async{
  String userId = await LoggedInUserBloc.instance().getUserId();
  setLoading(true);


  Map<String, dynamic> data = {
    "pandit_id": userId,
  };
  print("Pandit App = ${userId}");
  var response  = await ApiRemoteServices.fechingGetApi(apiUrl: GET_BOOKING_LIST,apiData: data);
  if(response is Success){

    Object data = getBookingListModelFromJson(response.response as String);
    setGetBookingModle(data as GetBookingListModel);
    notifyListeners();
  }else if(response is Failure) {
    UserError userError = UserError(code: response.code, message: response.errorResponse);
    setUserError(userError);
  }
  setLoading(false);

}


}