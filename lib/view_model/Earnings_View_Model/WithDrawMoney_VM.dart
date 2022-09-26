import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import '../../../Util/login_in_User.dart';
import '../../model/Earnings/WithDrawMoneyModel.dart';

class With_Draw_Money_VM with ChangeNotifier{
  bool _loading = false;
  WithDrawMoneyModel? _withDrawMoneyModel;
  UserError? _userError;

  bool get loading => _loading;
  WithDrawMoneyModel? get withDrawMoneyModel => _withDrawMoneyModel;
  UserError? get userError => _userError;

  setLoading(loading){
    _loading = loading;
    notifyListeners();
  }

  setwithDrawMoneyModel(WithDrawMoneyModel withDrawMoneyModel){
    _withDrawMoneyModel = withDrawMoneyModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = _userError;
    notifyListeners();
  }

  withdrawMoney_APIcall({String? id,}) async{
    setLoading(true);
    String userId = await LoggedInUserBloc.instance().getUserId();
    var data={
       //"bank_id":userId,
       // "bank_id":"404",

        "pandit_id": "7",

        "account_id": "1",

        "amount":"1600"

    };

    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl:GET_WITHDRAWMONEY_API,apiData: data);
    if(response is Success){
      Object data = withDrawMoneyModelFromJson(response.response as String);
      print("Govind with draw money ${response.response as String}");
      print("Govind with draw money ${data}");
      setwithDrawMoneyModel(data as WithDrawMoneyModel);
    }
    else if (response is Failure){
      UserError userError  =
      UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

}