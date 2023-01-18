import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import '../../../Util/login_in_User.dart';
import '../../../model/Profile_Screen/Bank_Account Details/DeleteBank_model.dart';
import '../../../model/Profile_Screen/Bank_Account Details/pandit_bank_list_model.dart';

class PanditBankListVM with ChangeNotifier{

  bool _loading = false;
  PanditBankListModel? _panditBankListModel;
  DeleteBankModel? _deleteBankModel;
  UserError? _userError;

  bool get loading => _loading;
  PanditBankListModel? get panditBankListModel => _panditBankListModel;
  DeleteBankModel? get deleteBankModel => _deleteBankModel;
  UserError? get userError => _userError;

  setLoading(loading){
    _loading = loading;
    notifyListeners();
  }

  setPanditBankListModel(PanditBankListModel panditBankListModel){
    _panditBankListModel = panditBankListModel;
    notifyListeners();
  }

  setUserError(UserError userError){
    _userError = _userError;
    notifyListeners();
  }

  setDeleteBankModel(DeleteBankModel deleteBankModel){
    _deleteBankModel = deleteBankModel;
    notifyListeners();
  }

  panditbankListAPIcall() async{
    String userId = await LoggedInUserBloc.instance().getUserId();
    setLoading(true);
    var data = {
       "pandit_id": userId,
    };
    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl:GET_GETPANDITBANKLIST_API,apiData: data);
    if(response is Success){
      Object data = panditBankListModelFromJson(response.response as String);
      setPanditBankListModel(data as PanditBankListModel);
    }
    else if (response is Failure){
      UserError userError  =
      UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

  Delete_Bank_APIcall({String? id,}) async{
    setLoading(true);
    var data = {
      "id": id
    };
    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl:GET_DELETEBANK_API,apiData: data);
    if(response is Success){
      Object data = deleteBankModelFromJson(response.response as String);
      setDeleteBankModel(data as DeleteBankModel);
      panditbankListAPIcall();
    }
    else if (response is Failure){
      panditbankListAPIcall();
      UserError userError  =
      UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

}
