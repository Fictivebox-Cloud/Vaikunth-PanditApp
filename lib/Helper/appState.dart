import 'package:shared_preferences/shared_preferences.dart';

class AppState {

Future<String>  getRegistionId () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String  reg=prefs.getString('savedRegistionId').toString();
    return reg;
  }

setRegistionId (String registration ) async {
  print("RG appState setRegistration ID"+ registration.toString());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('savedRegistionId',registration);

}
}