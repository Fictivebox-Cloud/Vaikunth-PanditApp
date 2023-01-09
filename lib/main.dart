import 'package:flutter/material.dart';
import 'package:panditapp/consts/themescolor.dart';
import 'package:panditapp/route_app/page_navigeter_name_route.dart';
import 'package:panditapp/route_app/route.dart';
import 'package:panditapp/view_model/Earnings_View_Model/GraphViewModel/WeekDayWiseDataVM.dart';
import 'package:panditapp/view_model/Earnings_View_Model/Life_Time_Pujas_VM.dart';
import 'package:panditapp/view_model/Earnings_View_Model/WithDrawMoney_VM.dart';
import 'package:panditapp/view_model/Login/ApiCallLogin.dart';
import 'package:panditapp/view_model/BookingViewDetails/Check_Booking_Confirm_OTP.dart';
import 'package:panditapp/view_model/BookingViewDetails/getBookingOTP.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Bank_List_VM.dart';
import 'package:panditapp/view_model/Login/CityListApi.dart';
import 'package:panditapp/view_model/BookingViewDetails/Complete_Bookings.dart';
import 'package:panditapp/view_model/Earnings_View_Model/Earnings_Home_VM.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Delete_Bank_VM.dart';
import 'package:panditapp/view_model/Profile/Help_Support_Details_VM.dart';
import 'package:panditapp/view_model/Notification_VM.dart';
import 'package:panditapp/view_model/Profile/Personal_Detail_View_Model.dart';
import 'package:panditapp/view_model/Profile/edit_profile_view_model.dart';
import 'package:panditapp/view_model/Profile/id_card_view_model.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Pandit_Bank_List_VM.dart';
import 'package:panditapp/view_model/Login/Service_VM.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Store_bank_VM.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Update_Bank_VM.dart';
import 'package:panditapp/view_model/BookingViewDetails/ViewDetails_VM.dart';
import 'package:panditapp/view_model/home_tab/Accept_Booking_Api.dart';
import 'package:panditapp/view_model/home_tab/Online_Ofline_view_model.dart';
import 'package:panditapp/view_model/home_tab/Reject_Booking_VM.dart';
import 'package:panditapp/view_model/home_tab/booking_request_view_model.dart';
import 'package:panditapp/view_model/Login/verification_number_api.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiCallLogin()),
        ChangeNotifierProvider(create: (_) => BookingRequestViewModel()),
        ChangeNotifierProvider(create: (_) => CompleteBookingViewModel()),
        ChangeNotifierProvider(create: (_) => AcceptBookingApi()),
        ChangeNotifierProvider(create: (_) => CityListApi()),
        ChangeNotifierProvider(create: (_) => NumberVerifyViewModel()),
        ChangeNotifierProvider(create: (_) => ViewDetailVM()),
        ChangeNotifierProvider(create: (_) => NotificationVM()),
        ChangeNotifierProvider(create: (_) => ServiceVM()),
        ChangeNotifierProvider(create: (_) => BankListVM()),
        ChangeNotifierProvider(create: (_) => PanditBankListVM()),
        ChangeNotifierProvider(create: (_) => HelpSupportDetails_VM()),
        ChangeNotifierProvider(create: (_) => NotificationVM()),
        ChangeNotifierProvider(create: (_) => OnlineOflineViewModel()),
        ChangeNotifierProvider(create: (_) => PujaConfirmOTP()),
        ChangeNotifierProvider(create: (_) => CheckBookingConfirmOTPViewModel()),
        ChangeNotifierProvider(create: (_) => IdCardViewModelView()),
        ChangeNotifierProvider(create: (_) => PersonalDetailViewModel()),
        ChangeNotifierProvider(create: (_) => UpdateBankVM()),
        ChangeNotifierProvider(create: (_) => StoreBankVM()),
        ChangeNotifierProvider(create: (_) => PersonalDetailViewModel()),
        ChangeNotifierProvider(create: (_) => EditProfileViewModel()),
        ChangeNotifierProvider(create: (_) => EarningsHomeVM()),
        ChangeNotifierProvider(create: (_) => DeleteBankVM()),
        ChangeNotifierProvider(create: (_) => WithDrawMoneyVM()),
        ChangeNotifierProvider(create: (_) => RejectBookingVM()),
        ChangeNotifierProvider(create: (_) => LifeTimePujaListVM()),
        ChangeNotifierProvider(create: (_) => WeekdataPerdayVM()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          appBarTheme: AppBarTheme(color: kPrimaryColor)),
          initialRoute:RouteName.SplashScreen,
          onGenerateRoute: Routes.generateRoutes,
    );
  }
}
