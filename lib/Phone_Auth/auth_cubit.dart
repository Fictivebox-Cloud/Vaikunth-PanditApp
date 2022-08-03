import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panditapp/Phone_Auth/auth_state.dart';

import '../Services/verification_number_api.dart';
import '../model/Verification_Model.dart';

class AuthCubit extends Cubit<AuthState>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super( AuthInitialState() ){
    User? currentUser = _auth.currentUser;
    if(currentUser != null){
      //Logged In
      emit( AuthLoggedInState(currentUser) );
    }
    else if(currentUser != null){
      //user tregisterd
      emit( AuthLoggedInState(currentUser) );
    }
    else{
      //Logged Out
      emit(AuthLoggedOutState());
    }
  }

  String? _verificationId;

  void sendOTP(String phoneNumber) async {
    emit( AuthLoadingState() );
   await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
     codeSent: (verificationId,forceResendingToken){
       _verificationId = verificationId;
        emit(AuthCodeSentState() );
     },
     verificationCompleted: (phoneAuthCredential) {
       signInWithPhone(phoneAuthCredential);
     },
     verificationFailed: (error) {
        emit( AuthErrorState(error.message.toString()) );
     },

     codeAutoRetrievalTimeout: (verificationId){
        _verificationId = verificationId;
     },
    );

  }

  void verifyOTP(String otp) async {

    emit( AuthLoadingState() );
    PhoneAuthCredential credential = PhoneAuthProvider.credential
      (verificationId: _verificationId!, smsCode: otp);
    signInWithPhone(credential);
  }
  checkUserId(String phone) async {
    VerificationNumberModel _verifyModel = VerificationNumberModel();

    Verification_Number_Api dd = Verification_Number_Api();
    _verifyModel = await dd.fachingApiVerificationnumber(phone);
    if(_verifyModel!.response!.notregister.toString()=="true"){
      emit(AuthLoggedHomeState ());



    }else{

      emit(AuthLoggedNameState());
    }


  }

  void signInWithPhone(PhoneAuthCredential credential) async {
    try{
     UserCredential userCredential =  await _auth.signInWithCredential(credential);
     if(userCredential.user !=null){
       emit( AuthLoggedInState(userCredential.user!) );
     }
    } on FirebaseAuthException catch(ex){
      emit( AuthErrorState(ex.message.toString()) );
    }
  }
  void logout() async{
    await _auth.signOut();
    emit(AuthLoggedOutState());
  }
}