import 'dart:io';

import 'package:flutter/cupertino.dart';

class RegisterationViewModel with ChangeNotifier {

  ///Name Screen
  bool _isNotNull = false;
  bool get isNotNull => _isNotNull;

  setIsNotNull({bool? data}) {
    _isNotNull = data!;
    notifyListeners();
  }

}