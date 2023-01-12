import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/consts/user_Error.dart';
import 'package:panditapp/repo/api_remote_services.dart';

import '../../Util/Api_collection.dart';
import '../../Util/login_in_User.dart';
import '../../View/Home/Home_Screen.dart';
import '../../model/Login Model/login_model.dart';
import '../../model/Login Model/registration_model.dart';
import '../Profile/Bank Account Details/Bank_List_VM.dart';

class ApiCallLogin extends ChangeNotifier {
  bool _eventListStatus = false;
  bool _loading = false;

  bool get eventListStatus => _eventListStatus;
  RegistrationResponseModel? _registrationResponseModel;
  UserError? _userError;

  bool _dataStatus = false;

  bool get loading => _loading;

  RegistrationResponseModel? get loginListModel => _registrationResponseModel;

  bool get dataStatus => _dataStatus;

  UserError? get userError => _userError;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(RegistrationResponseModel registrationResponseModele) {
    _registrationResponseModel = registrationResponseModele;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

}
