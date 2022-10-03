import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import '../../../Util/login_in_User.dart';
import '../../../model/Profile_Screen/Bank_Account Details/DeleteBank_model.dart';

class Delete_Bank_VM with ChangeNotifier{
  bool _loading = false;
  DeleteBankModel? _deleteBankModel;
  UserError? _userError;

  bool get loading => _loading;
  DeleteBankModel? get deleteBankModel => _deleteBankModel;
  UserError? get userError => _userError;

  setLoading(loading){
    _loading = loading;
    notifyListeners();
  }

  setDeleteBankModel(DeleteBankModel deleteBankModel){
    _deleteBankModel = deleteBankModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = _userError;
    notifyListeners();
  }

  Delete_Bank_APIcall({String? id,}) async{
    setLoading(true);
    // String userId = await LoggedInUserBloc.instance().getUserId();
    var data={
      "id": id
    };

    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl:GET_DELETEBANK_API,apiData: data);
    if(response is Success){
      Object data = deleteBankModelFromJson(response.response as String);
      print("Govind delete  bank account ${response.response as String}");
      setDeleteBankModel(data as DeleteBankModel);
    }
    else if (response is Failure){
      UserError userError  =
      UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

}