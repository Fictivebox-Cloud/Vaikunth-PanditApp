import 'dart:io';

import 'package:flutter/cupertino.dart';

class GetterloginSetter {


  String? _mobile ;
  String? _name;
  String? _services;
  String? _city;
  String? _aadhar;
  String? _pancard;
  String? _Account;
  File? _Photo;
  String? _choosebank;

  String? get choosebank => _choosebank;

  set choosebank(String? value) {
    _choosebank = value;
  }

  String? _ifsc;

  String? get mobile => _mobile;

  set mobile(String? value) {
    _mobile = value;
  }

  String? get Account => _Account;

  set Account(String? value) {
    _Account = value;
  }


  String? get city => _city;

  set city(String? value) {
    _city = value;
  }

  String? get services => _services;

  set services(String? value) {
    _services = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  File? get Photo => _Photo;

  set Photo(File? value) {
    _Photo = value;
  }

  String? get pancard => _pancard;

  set pancard(String? value) {
    _pancard = value;
  }

  String? get aadhar => _aadhar;

  set aadhar(String? value) {
    _aadhar = value;
  }

  String? get ifsc => _ifsc;

  set ifsc(String? value) {
    _ifsc = value;
  }
}