import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Util/login_in_User.dart';
import '../../../View/Home/Home_Screen.dart';
import '../../../model/Profile_Screen/Bank_Account Details/bank_list_model.dart';
import 'package:http/http.dart' as http;

class BankListVM with ChangeNotifier{
  bool _loading = false;
  BankListModel? _bankListModel;
  UserError? _userError;
  List? _bankList;
  String? _value;

  bool get loading => _loading;
  BankListModel? get bankListModel => _bankListModel;
  UserError? get userError => _userError;
  List? get bankList => _bankList;
  String? get value => _value;

  setLoading(loading){
    _loading = loading;
    notifyListeners();
  }

  setValue(String? data) {
    _value = data;
    notifyListeners();
  }

  setBankListModel(BankListModel bankListModel) {
    _bankListModel = bankListModel;
    notifyListeners();
  }

  setBankList(BankListModel bankListModel) {
    _bankListModel?.response?.banklist?.forEach((element) {
      _bankList?.add(element?.bankName ?? "");
    });
    notifyListeners();
  }

  setUserError(UserError userError){
    _userError = userError;
    notifyListeners();
  }

  bankListAPIcall() async{
    setLoading(true);
    _value = null;
    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl:GET_GETBANK_API,
    );
    if(response is Success){
      Object data = bankListModelFromJson(response.response as String);
      setBankListModel(data as BankListModel);
      setBankList(data);
    }
    else if (response is Failure){
      UserError userError  =
      UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

  Future fechingloginApi(
      {var mobile,
        var name,
        var services,
        var city,
        var aadharnumber,
        var pannumber,
        var account_number,
        var bank,
        var ifsc,
        File? photo,
        File? aadharfrontphoto,
        File? aadharbackphoto,
        File? panfile,
        String? apiUrl,
        BuildContext? context,
      }) async {
    setLoading(true);
    var headers = {
      'Authorization': 'Basic YW05dVpVQXlPVGM0OlJrbFVUa1ZUVTBBak1USXo=',
    };
    Map<String, String> map = Map<String, String>();

    map['pandit_mobile'] = mobile.toString();
    map['pandit_name'] = name;
    map['pandit_services'] = services;
    map['pandit_city'] = city;
    map['pandit_aadhar_number'] = aadharnumber.toString();
    map['pandit_pan_number'] = pannumber.toString();
    map['pandit_account_number'] = account_number.toString();
    map['pandit_bank'] = bank;
    map['pandit_ifsc'] = ifsc;

    var url = Uri.parse("https://dev-env.vaikunth.co/api/register");

    var request = http.MultipartRequest('POST', url);
    request.fields.addAll(map);

    request.files.add(
      await http.MultipartFile.fromPath('pandit_image', photo!.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath(
          'pandit_aadhar_front', aadharfrontphoto!.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath(
          'pandit_aadhar_back', aadharbackphoto!.path),
    );
    request.files.add(
      await http.MultipartFile.fromPath('pandit_pan_file', panfile!.path),
    );
    request.headers.addAll(headers);
    final response = await request.send();
    if(response.statusCode == 200) {
      var result = await http.Response.fromStream(response);
      var data = jsonDecode(result.body);
      log(data.toString());
      if(data['success']) {
        setLoading(false);
        LoggedInUserBloc.instance().setUserId(data['response']['pandit_register_id'].toString());
        Navigator.pushAndRemoveUntil(
            context!,
            MaterialPageRoute(
                builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false);
      } else {
        setLoading(false);
        Fluttertoast.showToast(msg: "Something Went Wrong");
      }
    }
  }

}