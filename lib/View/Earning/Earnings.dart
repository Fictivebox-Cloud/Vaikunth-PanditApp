import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:panditapp/View/Earning/components/Money_transferred_succesfully.dart';
import 'package:panditapp/view_model/Earnings_View_Model/Earnings_Home_VM.dart';
import 'package:provider/provider.dart';
import '../../Consts/text_const.dart';
import '../../Widgets/circular_loader.dart';
import '../../consts/themescolor.dart';
import '../../route_app/page_navigeter_name_route.dart';
import '../../view_model/Earnings_View_Model/GraphViewModel/WeekDayWiseDataVM.dart';
import '../../view_model/Earnings_View_Model/Life_Time_Pujas_VM.dart';
import '../../view_model/Earnings_View_Model/WithDrawMoney_VM.dart';
import '../../view_model/home_tab/Reject_Booking_VM.dart';
import 'Graph_Srceen/Monthly_Graph_Screen.dart';
import 'Graph_Srceen/Weekly_Graph_Screen.dart';

class Earnings_Screen extends StatefulWidget {
  const Earnings_Screen({Key? key}) : super(key: key);

  @override
  State<Earnings_Screen> createState() => _Earnings_ScreenState();
}

class _Earnings_ScreenState extends State<Earnings_Screen> {
  late Earnings_Home_VM earnings_home_vm;
  late Life_Time_Puja_List_VM life_time_puja_list_vm;
  var ht, wt;

  Future<void> _refresh(bool reload, BuildContext context){
    earnings_home_vm = Provider.of<Earnings_Home_VM?>(context,listen: false)!;
    earnings_home_vm.earningshomeAPIcall(reload);
    return Future.delayed(const Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    earnings_home_vm = context.watch<Earnings_Home_VM?>()!;
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body:earnings_home_vm.loading? Center(child: CircularLoader(),) : SafeArea(
        child: RefreshIndicator(
          onRefresh: () async{
            await _refresh(true, context);
          },
          color: kPrimaryColor,
          strokeWidth: 5,
          displacement: 0,
          child: Column(
            children: [
              myEarningAppBar(),
              SizedBox(
                height: 16,
              ),
              bodyMyEarning()
            ],
          ),
        ),
      ),
    );
  }
  Widget myEarningAppBar(){
    return Container(
      width: double.infinity,
      height: ht * 0.2,
      color: kPrimaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              MY_EARNINGS,
              style: GoogleFonts.lato(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          walletContainer()
        ],
      ),
    );
  }
  Widget bodyMyEarning(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              lifeTimePujas_earning_Container(),
              SizedBox(
                height: 24,
              ),
              Text(
                WEEKLY,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: h1Color),
              ),
              SizedBox(
                height: 8,
              ),
              //Bar_Chart_Screen(),
              weekly_Container(),
              const SizedBox(
                height: 24,
              ),
              Text(
                MONTHLY,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: h1Color),
              ),
              SizedBox(
                height: 24,
              ),
              monthly_Container(),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget walletContainer(){
    return Container(
      width: wt * 0.9,
      height: 60,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [
                Text(
                  WALLET,
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kSecondaryColor),
                ),
                Text(
                  //"₹2518.00"
                  "₹ ${earnings_home_vm.earningsHomeModel?.response!.walletvalue ?? ""}",
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: h1Color),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                WeekdataPerdayVM weekdataperday =
                Provider.of<WeekdataPerdayVM>(context, listen: false);
                weekdataperday.WeekdataPerdayApicall();


                With_Draw_Money_VM withdrawmoney=
                Provider.of<With_Draw_Money_VM>(context, listen: false);
                withdrawmoney.WithDrawMoney_APIcall();

                showModalBottomSheet(
                    context: context,
                    builder: (builder) => bottomSheet(),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(4),
                        )));
              },
              child: Container(
                width: wt * 0.3,
                //height: ht * 0.07,
                height: 44,
                decoration: BoxDecoration(
                    color: b1Color,
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                    child: Text(
                      WITHDRAW,
                      style: GoogleFonts.lato(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget lifeTimePujas_earning_Container(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 156,
          height: 68,
          decoration: BoxDecoration(
              color: b1Color,
              borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [
                Text(
                  LIFE_TIME_EARNINGS,
                  style: GoogleFonts.lato(
                      color: Color(0xffECF1F6),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  //"₹23652.25"
                  "₹ ${earnings_home_vm.earningsHomeModel?.response!.lifetimeearnings ?? ""}",
                  style: GoogleFonts.lato(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            life_time_puja_list_vm = Provider.of<Life_Time_Puja_List_VM?>(context,listen: false)!;
            life_time_puja_list_vm.lifetimepujaAPIcall();
            Navigator.pushNamed(context, RouteName.Life_time_puja);
          },
          child: Container(
            width: 156,
            height: 68,
            decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    LIFE_TIME_PUJA,
                    style: GoogleFonts.lato(
                        color: const Color(
                          0xffECF1F6,
                        ),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        //"152"
                        "₹ ${earnings_home_vm.earningsHomeModel?.response!.lifetimepuja ?? ""}",
                        style: GoogleFonts.lato(
                            color: white,
                            fontSize: 18,
                            fontWeight:
                            FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget weekly_Container(){
    return Container(
      width: double.infinity,
      height: 263,
      child: Column(
        children: [
          Expanded(child: Weekly_Graph_Screen()),
        ],
      ),
    );
  }
  Widget monthly_Container(){
    return Container(
      width: double.infinity,
      height: 263,
      child: Column(
        children: [
          Expanded(
              child: Monthly_Graph_Screen()),
        ],
      ),
    );
  }
  Widget bottomSheet() {
   // List<int> _selectedItems = List<>();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 333,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            WITHDRAW_MONEY_TO_BANK_ACCOUNT,
            style: GoogleFonts.lato(
                fontSize: 16, fontWeight: FontWeight.w600, color: p1Color),
          ),
          SizedBox(
            height: 16,
          ),
          Center(
              child: Text(
            //"₹2518.00"
            "₹ ${earnings_home_vm.earningsHomeModel?.response!.walletvalue ?? ""}",
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w600, fontSize: 24, color: h1Color),
          )),
          SizedBox(
            height: 16,
          ),


          Expanded(

            child: ListView.builder(itemBuilder: (context , int index){

              @override
              initState(){
                super.initState();
                setState(() {
                  index;
                });
              }
              return Row(
                children: [
                  Radio(value: index, groupValue: 1, onChanged: (value) {}),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "IndusInd Bank",
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: p1Color),
                      ),
                      Text(
                        "2541XXXXXXXX2653",
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: h1Color),
                      )
                    ],
                  )
                ],
              );


            },
              itemCount: 11,
            ),
          ),


          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: b1Color),
            child: Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Money_transferred_succesfully()));
                    },
                    child: Text(
                      SEND_MONEY_TO_BANK_ACCOUNT,
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          color: white,
                          fontWeight: FontWeight.w500),
                    ))),
          )
        ],
      ),
    );
  }
}
