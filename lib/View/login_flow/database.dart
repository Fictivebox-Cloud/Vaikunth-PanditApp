
/// A class which will hold application variables to use
/// it on different screens

class FDatabase {
  static  final FDatabase _instance = FDatabase._private();
  FDatabase._private();

  String phoneNumber='';

  static FDatabase get instance => _instance;
  setAllDetailsEmpty(){
    phoneNumber="";

  }
}
