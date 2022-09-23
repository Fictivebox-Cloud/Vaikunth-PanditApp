import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedInUserBloc {
  static const _USER_PREF_KEY = "__user__";
  static const _USER_DETAILS = "__user_details__";
  static const _USER_TYPE = "__user_type__";
  static const _USERID_KEY = "__user_id__";
  static const _Guest_user_KEY = "__guest_user_id__";
  static User? _user;


  LoggedInUserBloc._private();
  static LoggedInUserBloc? _instance;

  factory LoggedInUserBloc.instance() {
    _instance = LoggedInUserBloc._private();
    return _instance!;
  }

  Future<String> getUserId() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String userId = _pref.getString(_USERID_KEY) ?? "0";
    return userId;
  }

  Future<String> setUserId(String userId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString(_USERID_KEY, userId);
    return userId;
  }

  Future logout(BuildContext context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString(_USER_PREF_KEY, '');
    _pref.setBool('isPanditApp', false);
    return;
  }


}