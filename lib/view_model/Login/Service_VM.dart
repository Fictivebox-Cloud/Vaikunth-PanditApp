import 'package:flutter/material.dart';
import 'package:panditapp/Consts/user_Error.dart';
import 'package:panditapp/Util/Api_collection.dart';
import 'package:panditapp/Util/api_status.dart';
import 'package:panditapp/repo/api_remote_services.dart';
import '../../model/Login Model/Service_Model.dart';

class ServiceVM with ChangeNotifier{
  bool _loading = false;
  int? _index;
  ServiceModel? _serviceModel;
  UserError? _userError;

  bool get loading => _loading;
  ServiceModel? get serviceModel => _serviceModel;
  UserError? get userError => _userError;
  int? get index => _index;

  setIndex(index){
    _index = index;
    notifyListeners();
  }


  setLoading(loading){
    _loading = loading;
    notifyListeners();
  }

  setServiceModel(ServiceModel serviceModel){
    _serviceModel = serviceModel;
    notifyListeners();
  }
  setUserError(UserError userError){
    _userError = _userError;
    notifyListeners();
  }

  ServiceVm(){
    serviceAPIcall();
  }

  serviceAPIcall() async{
    setLoading(true);

    var response = await ApiRemoteServices.fechingGetApi(
        apiUrl:GET_SERVICE_API,);
    if(response is Success){
      Object data = serviceModelFromJson(response.response as String);
      print("Govind service booking list${response.response as String}");
      setServiceModel(data as ServiceModel);

    }
    else if (response is Failure){
      UserError userError  =
      UserError(code: response.code,message: response.errorResponse);
      setUserError(userError);
      notifyListeners();
    }
    setLoading(false);
  }

}