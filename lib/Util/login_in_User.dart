import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedInUserBloc {
  static const _USER_PREF_KEY = "__user__";
  static const _USERID_KEY = "__user_id__";
  static const _Guest_user_KEY = "__guest_user_id__";
  static const _USER_DETAILS = "__user_details__";

  static User? _user;
  LoggedInUserBloc._private();
  static LoggedInUserBloc? _instance;


  factory LoggedInUserBloc.instance() {
    _instance = LoggedInUserBloc._private();
    return _instance!;
  }
  Future<void> initialize({bool forceInitialize = false}) async {
    try {
      await LoggedInUserBloc.instance().isUserSaved();
    } catch (e) {
      print('$e');
    }
  }



  void deleteUser() {
    _user = null;
  }


  /// To check whether user data is saved in preferences or not
  Future<bool> isUserSaved() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String user = _pref.getString(_USER_PREF_KEY) ?? '';
    bool isTrainerLogin = _pref.getBool('isTrainerApp') ?? false;
    if (isTrainerLogin == true) {
      if (user.isNotEmpty && user != 'null') {
        try {
          Map<String, dynamic> json = jsonDecode(user);

          // _trainer = await TrainerDetails.fromJson(json);
        } catch (ex) {
          log("--aa error:" + ex.toString());
        }
        // AppState.trainerProfileModel.trainerDetails = _trainer;
        // _isTrainer = true;
        // FDatabase.instance.userId = _trainer!.id ?? 0;
        return true;
      }
    } else {
      // if (user.isNotEmpty && user != 'null') {
      //   _user = User?.fromJson(jsonDecode(user));
      //   FDatabase.instance.userId = _user?.userId ?? 0;
      // }
    }
    return user.isNotEmpty && user != 'null';
  }

  Future setGuestUser({bool isGuest = true}) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool(_Guest_user_KEY, isGuest);
  }
  /// to save user data in preferences
  void saveUser(User user)async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString(_USER_PREF_KEY, user.toString());

    _pref.setBool('isPanditApp', false);
  }
  /// To check whether user data is saved in preferences or not
  Future<int> getUserId() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    int userId = _pref.getInt(_USERID_KEY) ?? 0;
    return userId;
  }

  Future<bool> isGuestUser() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    bool user = _pref.getBool(_Guest_user_KEY) ?? false;
    return user;
  }

  Future<int> setUserId(int userId) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setInt(_USERID_KEY, userId);
    return userId;
  }

  Future logout(BuildContext context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    bool isGuestUser = await LoggedInUserBloc.instance().isGuestUser();

    if (!isGuestUser) {
      _pref.setString(_USER_PREF_KEY, '');
      _pref.setString(_USER_DETAILS, '');
      _pref.setBool('isPanditApp', false);



    } else {

      await setGuestUser(isGuest: false);
    }
    return;
  }


}