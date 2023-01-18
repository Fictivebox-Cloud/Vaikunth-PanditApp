import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:panditapp/View/Earning/components/Money_transferred_succesfully.dart';
import 'package:panditapp/view_model/Earnings_View_Model/Earnings_Home_VM.dart';
import 'package:provider/provider.dart';
import '../../Consts/text_const.dart';
import '../../Util/Appbar.dart';
import '../../Widgets/circular_loader.dart';
import '../../consts/themescolor.dart';
import '../../view_model/Earnings_View_Model/GraphViewModel/WeekDayWiseDataVM.dart';
import '../../view_model/Earnings_View_Model/Life_Time_Pujas_VM.dart';
import 'Graph_Srceen/Monthly_Graph_Screen.dart';
import 'Graph_Srceen/Weekly_Graph_Screen.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({Key? key}) : super(key: key);

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  late EarningsHomeVM earnings_home_vm;
  late LifeTimePujaListVM life_time_puja_list_vm;
  var ht, wt;

  Future<void> _refresh(bool reload, BuildContext context){
    earnings_home_vm = Provider.of<EarningsHomeVM?>(context,listen: false)!;
    earnings_home_vm.earningshomeAPIcall(reload);
    return Future.delayed(const Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    WeekdataPerdayVM weekdataperday =
    Provider.of<WeekdataPerdayVM>(context, listen: false);
    weekdataperday.WeekdataPerdayApicall();

    earnings_home_vm = context.watch<EarningsHomeVM?>()!;
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
              AppBarcomon(),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 15),
                child:
                //TotalEarningGraph(),
                graph(),
              ),
              //myEarningAppBar(),
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
  Widget bodyMyEarning(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // walletContainer(),
             // TotalEarningGraph(),
             // lifeTimePujas_earning_Container(),
              SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  WEEKLY,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: h1Color),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              //Bar_Chart_Screen(),
              weekly_Container(),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  MONTHLY,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: h1Color),
                ),
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

  Widget weekly_Container(){
    return Container(

      width: double.infinity,
      height: 263,
      child: Column(
        children: [
          Expanded(child: WeeklyGraphScreen()),
        ],
      ),
    );
  }
  Widget monthly_Container(){
    return Container(
      width: double.infinity,
      height: 278,
      child: Column(
        children: [
          Expanded(
              child: MonthlyGraphScreen()),
        ],
      ),
    );
  }
  Widget graph(){
    return  Container(
      padding: EdgeInsets.only(left: 16,right: 16,top: 1),
      height: 168,
      //width: d,
      decoration: BoxDecoration(
          color: Color(0xFFffffff),
          boxShadow: [
            BoxShadow(
              color: Color(0xffFFD1CC),
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 8.0, //extend the shadow
              // offset: Offset(
              //   1.0, // Move to right 5  horizontally
              //   5.0, // Move to bottom 5 Vertically
              // ),
            )
          ],

          //border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                // color: Colors.blue,
                height:62 ,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Earning",style: GoogleFonts.lato(fontSize:14,fontWeight: FontWeight.w400,color:Color(0xff7C7C7C)),),
                    Spacer(),
                    Text( "₹ ${earnings_home_vm.earningsHomeModel?.response!.walletvalue ?? ""}",style: GoogleFonts.lato(fontSize:24,fontWeight: FontWeight.w700),),
                  ],
                ),
              ),
            ),
            //Spacer(),
            SizedBox(width: 16,),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: double.infinity,
                height: 62,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(
                    height: 33,
                    width: double.infinity,
                    child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xff449473)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
                    //side: BorderSide(color: Colors.red)
              )
            )
    ),
                        onPressed: (){
                          showModalBottomSheet(
                              context: context,
                              builder: (builder) => bottomSheet(),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4),
                                  )));

                        },
                        child: Text(WITHDRAW)
                    ),
                  )
                  ],
                ),
              ),
            )
          ],),
          Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffE2FFF3),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                height: 62,
                width: double.infinity,
                //color: Colors.red,
                child: Column(
                  children: [
                    Text("Today Earn"),
                    Text("700"),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16,),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffFFD1CC),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                height: 62,
                width: double.infinity,
                //color: Colors.orangeAccent,
                child: Column(
                  children: [
                    Text("Total Visits"),
                    Text("100"),

                  ],
                ),
              ),
            ),
          ],),



        ],),
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

            child:ListView.builder(itemBuilder: (context , int index){

              @override
              initState(){
                super.initState();
                setState(() {
                  index;
                });
              }
              return Row(
                children: [
                  Radio(value: index, groupValue: 0, onChanged: (value) {}),
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
                borderRadius: BorderRadius.circular(4), color: kPrimaryColor),
            child: Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MoneyTransferredSuccesfully()));
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
