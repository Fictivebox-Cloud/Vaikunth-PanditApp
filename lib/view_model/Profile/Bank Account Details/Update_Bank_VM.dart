import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import '../../../model/Profile_Screen/Bank_Account Details/Bank_List_Model.dart';
import '../../../model/Profile_Screen/Bank_Account Details/Pandit_Bank_List_Model.dart';
import '../../../model/Profile_Screen/Bank_Account Details/Update_Bank_Model.dart';
import '../../../model/Profile_Screen/Settings/Help_Support_Details_Model.dart';
import '../../../model/Login Model/Service_Model.dart';

class Update_Bank_VM with ChangeNotifier{
  bool _loading = false;
  UpdateBankModel? _updateBankModel;
  UserError? _userError;

  bool get loading => _loading;
  UpdateBankModel? get updatebankModel => _updateBankModel;
  UserError? get userError => _userError;

  setLoading(loading){
    _loading = loading;
    notifyListeners();
  }

  setUpdateBankModel(UpdateBankModel updatebankModel){
    _updateBankModel = updatebankModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = _userError;
    notifyListeners();
  }

  Update_Bank_APIcall({String? id, String? name,String? bankname,String? ifsccode,String? accountno}) async{
    setLoading(true);
    var data={
      "bank_id":id,
      "account_holder_name":name,
      "bank_name": bankname,
      "ifsc_code": ifsccode,
      "bank_account_no":accountno
    };

    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl:GET_UPDATEBANK_API,apiData: data);
    if(response is Success){
      Object data = updateBankModelFromJson(response.response as String);
      print("Govind Update bank ${response.response as String}");
      setUpdateBankModel(data as UpdateBankModel);
    }
    else if (response is Failure){
      UserError userError  =
      UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

}