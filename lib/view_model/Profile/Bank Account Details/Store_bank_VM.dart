import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Util/login_in_User.dart';
import '../../../model/Profile_Screen/Bank_Account Details/store_bank_model.dart';
import '../../../model/Profile_Screen/Bank_Account Details/update_bank_model.dart';

class StoreBankVM with ChangeNotifier {
  bool _loading = false;
  StoreBankModel? _storeBankModel;
  UserError? _userError;

  UpdateBankModel? _updateBankModel;
  UserError? _error;

  bool get loading => _loading;

  UpdateBankModel? get updateBankModel => _updateBankModel;

  StoreBankModel? get storeBankModel => _storeBankModel;

  UserError? get userError => _userError;

  UserError? get error => _error;

  setLoading(loading) {
    _loading = loading;
    notifyListeners();
  }

  setStoreBankModel(StoreBankModel storeBankModel) {
    _storeBankModel = storeBankModel;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
    notifyListeners();
  }

  setUpdateBankModel(UpdateBankModel updateBankModel) {
    _updateBankModel = updateBankModel;
    notifyListeners();
  }

  setError(UserError error) {
    _error = error;
    notifyListeners();
  }

  Store_Bank_APIcall(
      {String? name,
      String? bankname,
      String? ifsccode,
      String? accountno,
      String? defaultBank,
      }) async {
    setLoading(true);
    String userId = await LoggedInUserBloc.instance().getUserId();
    var data = {
      "pandit_id": userId,
      "account_holder_name": name,
      "bank_name": bankname,
      "ifsc_code": ifsccode,
      "bank_account_no": accountno,
      "defaultBank": defaultBank,
    };
    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl: GET_STOREBANK_API, apiData: data);
    if (response is Success) {
      Object data = storeBankModelFromJson(response.response as String);
      setStoreBankModel(data as StoreBankModel);
    } else if (response is Failure) {
      UserError userError =
          UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

  updateBankAccountDetail({
        String? bankId,
        String? name,
      String? bankname,
      String? ifsccode,
      String? accountno,
      String? defaultBank,
      }) async {
    setLoading(true);
    String userId = await LoggedInUserBloc.instance().getUserId();
    var data = {
      "pandit_id": userId,
      "bank_id": bankId,
      "account_holder_name": name,
      "bank_name": bankname,
      "ifsc_code": ifsccode,
      "bank_account_no": accountno,
      "defaultBank": defaultBank,
    };
    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl: GET_UPDATEBANK_API, apiData: data);
    if (response is Success) {
      Object data = updateBankModelFromJson(response.response as String);
      setUpdateBankModel(data as UpdateBankModel);
    } else if (response is Failure) {
      UserError userError =
          UserError(code: response.code, message: response.errorResponse);
      setError(userError);
    }
    setLoading(false);
  }

}
