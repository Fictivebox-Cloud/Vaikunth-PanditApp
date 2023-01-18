import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Consts/text_const.dart';
import '../../../Consts/themescolor.dart';
import '../../../model/Graph_Model/Bar_Chart_Model.dart';
import '../../../view_model/Earnings_View_Model/GraphViewModel/WeekDayWiseDataVM.dart';

class WeeklyGraphScreen extends StatelessWidget {
  WeeklyGraphScreen({Key? key}) : super(key: key);
  late WeekdataPerdayVM weekdataPerdayVM;

  // WeekdataPerdayVM weekdataperday;

  String totalBooking(int online, int offline) {
    return (online + offline).toString();
  }

  @override
  Widget build(BuildContext context) {
    weekdataPerdayVM = context.watch<WeekdataPerdayVM>();
    print(DateTime.now().toString().replaceRange(10, DateTime
        .now()
        .toString()
        .length, ""),);
    print(weekdataPerdayVM.weekdataPerdayModel?.response?.weekdata?.isEmpty);
    List<charts.Series<WeeklyGraphModel, String>> series = [
      charts.Series(
        id: "perdaybooking",
        data: [
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response?.weekdata
                ?.isEmpty ?? true ? DateTime.now().toString().replaceRange(
                10, DateTime
                .now()
                .toString()
                .length, "") : weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?[0].myDate.toString().split(" ")[0].replaceRange(
                0, 5, "") ?? DateTime.now().toString().replaceRange(10, DateTime
                .now()
                .toString()
                .length, ""),
            perdaybooking: weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?.isEmpty ?? true ? 0 : weekdataPerdayVM
                .weekdataPerdayModel?.response?.weekdata?[0].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(graphcolor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response?.weekdata
                ?.isEmpty ?? true ? DateTime.now().toString().replaceRange(
                10, DateTime
                .now()
                .toString()
                .length, "") : weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?[1].myDate.toString().split(" ")[0].replaceRange(
                0, 5, "") ?? DateTime.now().toString().replaceRange(10, DateTime
                .now()
                .toString()
                .length, ""),
            perdaybooking: weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?.isEmpty ?? true ? 0 : weekdataPerdayVM
                .weekdataPerdayModel?.response?.weekdata?[1].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(graphcolor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response?.weekdata
                ?.isEmpty ?? true ? DateTime.now().toString().replaceRange(
                10, DateTime
                .now()
                .toString()
                .length, "") : weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?[2].myDate.toString().split(" ")[0].replaceRange(
                0, 5, "") ?? DateTime.now().toString().replaceRange(10, DateTime
                .now()
                .toString()
                .length, ""),
            perdaybooking: weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?.isEmpty ?? true ? 0 : weekdataPerdayVM
                .weekdataPerdayModel?.response?.weekdata?[2].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(graphcolor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response?.weekdata
                ?.isEmpty ?? true ? DateTime.now().toString().replaceRange(
                10, DateTime
                .now()
                .toString()
                .length, "") : weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?[3].myDate.toString().split(" ")[0].replaceRange(
                0, 5, "") ?? DateTime.now().toString().replaceRange(10, DateTime
                .now()
                .toString()
                .length, ""),
            perdaybooking: weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?.isEmpty ?? true ? 0 : weekdataPerdayVM
                .weekdataPerdayModel?.response?.weekdata?[3].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(graphcolor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response?.weekdata
                ?.isEmpty ?? true ? DateTime.now().toString().replaceRange(
                10, DateTime
                .now()
                .toString()
                .length, "") : weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?[4].myDate.toString().split(" ")[0].replaceRange(
                0, 5, "") ?? DateTime.now().toString().replaceRange(10, DateTime
                .now()
                .toString()
                .length, ""),
            perdaybooking: weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?.isEmpty ?? true ? 0 : weekdataPerdayVM
                .weekdataPerdayModel?.response?.weekdata?[4].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(graphcolor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response?.weekdata
                ?.isEmpty ?? true ? DateTime.now().toString().replaceRange(
                10, DateTime
                .now()
                .toString()
                .length, "") : weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?[5].myDate.toString().split(" ")[0].replaceRange(
                0, 5, "") ?? DateTime.now().toString().replaceRange(10, DateTime
                .now()
                .toString()
                .length, ""),
            perdaybooking: weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?.isEmpty ?? true ? 0 : weekdataPerdayVM
                .weekdataPerdayModel?.response?.weekdata?[5].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(graphcolor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response?.weekdata
                ?.isEmpty ?? true ? DateTime.now().toString().replaceRange(
                10, DateTime
                .now()
                .toString()
                .length, "") : weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?[6].myDate.toString().split(" ")[0].replaceRange(
                0, 5, "") ?? DateTime.now().toString().replaceRange(10, DateTime
                .now()
                .toString()
                .length, ""),
            perdaybooking: weekdataPerdayVM.weekdataPerdayModel?.response
                ?.weekdata?.isEmpty ?? true ? 0 : weekdataPerdayVM
                .weekdataPerdayModel?.response?.weekdata?[6].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(graphcolor),
          ),
        ],
        domainFn: (WeeklyGraphModel series, _) => series.my_date,
        measureFn: (WeeklyGraphModel series, _) => series.perdaybooking,
        colorFn: (WeeklyGraphModel series, _) => series.color,
      ),
    ];

    return Consumer<WeekdataPerdayVM>(
      builder: (_, provider, __) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(33),
                border: Border.all(width: 1, color: kPrimaryColor)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 10, bottom: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                      ),
                      Column(
                        children: [
                          Text( //"Dec 7-13"
                            "${weekdataPerdayVM.weekdataPerdayModel?.response!
                                .weekdata?.isEmpty ?? true ? DateTime.now().toString().replaceRange(10, DateTime
                                .now()
                                .toString()
                                .length, "") : weekdataPerdayVM
                                .weekdataPerdayModel?.response!.weekdata![0]
                                .myDate.toString()
                                .split(" ")[0] ?? ""}",
                            style: GoogleFonts.lato(
                              //color: white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          Text("₹1200.00", style: GoogleFonts.lato(
                            //color: white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                  Expanded(
                    child: charts.BarChart(
                      series,
                      animate: true,
                    ),
                  ),
                  Divider(
                    color: dividerr,
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TOTAL_BOOKING,
                            style: TextStyle(
                                color: p1Color,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            totalBooking(
                                weekdataPerdayVM.weekdataPerdayModel?.response!
                                    .online ?? 0,
                                weekdataPerdayVM.weekdataPerdayModel?.response!
                                    .offline ?? 0),
                            //weekdataPerdayVM.weekdataPerdayModel.response.weekdata[]

                            style: TextStyle(
                                color: h1Color,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ONLINE,
                            style: TextStyle(
                                color: p1Color,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            weekdataPerdayVM.weekdataPerdayModel?.response!
                                .online.toString() ?? "",
                            //"2",
                            style: TextStyle(
                                color: h1Color,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            OFFLINE,
                            style: TextStyle(
                                color: p1Color,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text( //"77",
                            weekdataPerdayVM.weekdataPerdayModel?.response!
                                .offline.toString() ?? "",
                            //provider.weekdataPerdayModel.response?.online ??"",
                            style: TextStyle(
                                color: h1Color,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
