import 'package:fluttertoast/fluttertoast.dart';
import 'package:panditapp/consts/themescolor.dart';

class Utils {

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: kPrimaryColor,
      toastLength: Toast.LENGTH_SHORT
    );

  }

}