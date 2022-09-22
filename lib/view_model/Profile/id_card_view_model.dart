import 'package:flutter/cupertino.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Util/Api_collection.dart';
import '../../Util/login_in_User.dart';
import '../../model/profile/id_card_model.dart';

class Id_card_view_model_View with ChangeNotifier {
  bool _loading = false;
  PanditDetailsIdcradModel? _panditDetailsIdcradModel;
  UserError? _userError;


  bool get loading => _loading;

  PanditDetailsIdcradModel? get getPanditDetailsIdcradModel =>
      _panditDetailsIdcradModel;

  UserError? get userError => _userError;
  Id_card_view_model_View(){
  getPanditDetailsId();
}

  setLoading( loading){
    _loading = loading;
    notifyListeners();
  }

  setPanditDetailsIdcradModel(PanditDetailsIdcradModel panditDetailsIdcradModel){
    _panditDetailsIdcradModel = panditDetailsIdcradModel;
    notifyListeners();
  }

setUserError(UserError userError){
    _userError =userError;
    notifyListeners();
}
 getPanditDetailsId() async{
    setLoading(true);
    String userId = await LoggedInUserBloc.instance().getUserId();
    Map<String, dynamic> data = {
      "pandit_id": userId,
    };
    var response = await ApiRemoteServices.fechingGetApi(apiUrl:GET_ID_CARD,apiData: data );
    if(response is Success){

      Object data = panditDetailsIdcradModelFromJson(response.response as String);
      setPanditDetailsIdcradModel(data as PanditDetailsIdcradModel);
    }else if(response is Failure){
      UserError userError = UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
    }
setLoading(false);
}

}