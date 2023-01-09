import 'package:flutter/cupertino.dart';

class RegisterationViewModel with ChangeNotifier {

  bool _isNotNull = false;
  bool get isNotNull => _isNotNull;

  setIsNotNull({bool? data}) {
    _isNotNull = data!;
    notifyListeners();
  }

}