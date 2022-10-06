import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Consts/text_const.dart';
import '../../../Widgets/circular_loader.dart';
import '../../../consts/themescolor.dart';
import '../../../view_model/Earnings_View_Model/Life_Time_Pujas_VM.dart';


class LifeTimePuja extends StatefulWidget {
  const LifeTimePuja({Key? key}) : super(key: key);

  @override
  State<LifeTimePuja> createState() => _LifeTimePujaState();
}

class _LifeTimePujaState extends State<LifeTimePuja> {
  var ht, wt;
  late LifeTimePujaListVM life_time_puja_list_vm;


  Future<void> _refresh(bool reload, BuildContext context){

     life_time_puja_list_vm = Provider.of<LifeTimePujaListVM?>(context,listen: false)!;
    life_time_puja_list_vm.lifetimepujaAPIcall();

    return Future.delayed(const Duration(seconds: 0));


  }


  @override
  Widget build(BuildContext context) {
    life_time_puja_list_vm = context.watch<LifeTimePujaListVM?>()!;

   // _refresh(reload);
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          LIFE_TIME_PUJA,
          style: GoogleFonts.lato(
              fontSize: 18, fontWeight: FontWeight.w600, color: white),
        ),
      ),
      body:life_time_puja_list_vm.loading? Center(child: CircularLoader(),):

      SafeArea(
        child: RefreshIndicator(
          onRefresh: () async{
            await _refresh(true, context);
          },
          color: kPrimaryColor,
          strokeWidth: 5,
          displacement: 0,
            child: Container(
            padding: EdgeInsets.only(top: 23),
            child: ListView.builder(

              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                  child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: kSecondaryColor)),
                      child: Column(
                        children: [
                          Text(
                            life_time_puja_list_vm.lifeTimePujaListModel?.response?.lifetimepujalist?[index].hostname.toString() ?? "",
                           // "Arvind Singh",
                            style: GoogleFonts.lato(
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(
                                    width: 11,
                                  ),
                                  Text(
                                    life_time_puja_list_vm.lifeTimePujaListModel?.response?.lifetimepujalist?[index].bookingPujaDate?? "",
                                    //"Mon 05/Oct/2021",
                                    style: GoogleFonts.lato(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Text(
                                TOTAL_EARNING + "${life_time_puja_list_vm.lifeTimePujaListModel?.response?.lifetimepujalist![index].totalEarning.toString()}",
                                    //" ₹568",
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600, fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      )),
                );
              },
             // itemCount: life_time_puja_list_vm.lifeTimePujaListModel!.response!.lifetimepujalist!.length
              itemCount: life_time_puja_list_vm.lifeTimePujaListModel?.response?.lifetimepujalist!.length ?? 0
            ),
        ),
          ),
      )

    );
  }
}
