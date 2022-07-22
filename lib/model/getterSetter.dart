import 'package:flutter/cupertino.dart';

class GetterloginSetter {


  String? _mobile ;
  String? _name;
  String? _services;
  String? _city;
  String? _Documents;
  String? _Account;
  String? _Photo;

  String? get mobile => _mobile;

  set mobile(String? value) {
    _mobile = value;
  }

  String? get Account => _Account;

  set Account(String? value) {
    _Account = value;
  }

  String? get Documents => _Documents;

  set Documents(String? value) {
    _Documents = value;
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

  String? get Photo => _Photo;

  set Photo(String? value) {
    _Photo = value;
  }
}