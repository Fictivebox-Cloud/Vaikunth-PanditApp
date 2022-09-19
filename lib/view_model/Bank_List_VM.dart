import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Profile_Screen/Bank_Account Details/Bank_List_Model.dart';
import '../model/Service_Model.dart';

class BankList_VM with ChangeNotifier{
  bool _loading = false;
  BankListModel? _bankListModel;
  UserError? _userError;

  bool get loading => _loading;
  BankListModel? get bankListModel => _bankListModel;
  UserError? get userError => _userError;

  setLoading(loading){
    _loading = loading;
    notifyListeners();
  }

  BankList_VM(){
    bankListAPIcall();
  }

  setBankListModel(BankListModel bankListModel){
    _bankListModel = bankListModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = userError;
    notifyListeners();
  }

  bankListAPIcall() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setLoading(true);
    String? userId = prefs.getString("pandit_id");
    var data={
      "pandit_id": userId,
    };

    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl:GET_GETBANK_API,apiData: data);
    if(response is Success){
      Object data = bankListModelFromJson(response.response as String);
      print("Govind  Bank list${response.response as String}");
      setBankListModel(data as BankListModel);
    }
    else if (response is Failure){
      UserError userError  =
      UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

}