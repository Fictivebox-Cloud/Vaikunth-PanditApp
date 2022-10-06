import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Consts/text_const.dart';
import '../../../Consts/themescolor.dart';
import '../../../model/Graph_Model/Bar_Chart_Model.dart';
import '../../../view_model/Earnings_View_Model/GraphViewModel/WeekDayWiseDataVM.dart';

class Weekly_Graph_Screen extends StatelessWidget {
  Weekly_Graph_Screen({Key? key}) : super(key: key);
  late WeekdataPerdayVM weekdataPerdayVM;
 // WeekdataPerdayVM weekdataperday;

  final List<WeeklyGraphModel> data = [
    WeeklyGraphModel(
      year: "2",
      financial: 250,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    WeeklyGraphModel(
      year: "3",
      financial: 300,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    WeeklyGraphModel(
      year: "4",
      financial: 100,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    WeeklyGraphModel(
      year: "5",
      financial: 450,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    WeeklyGraphModel(
      year: "6",
      financial: 630,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    WeeklyGraphModel(
      year: "7",
      financial: 950,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    WeeklyGraphModel(
      year: "8",
      financial: 400,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
  ];

  String totalBooking(int online, int offline) {
    return (online + offline).toString();
  }

  @override
  Widget build(BuildContext context) {
    weekdataPerdayVM = context.watch<WeekdataPerdayVM>();



    List<charts.Series<WeeklyGraphModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (WeeklyGraphModel series, _) => series.year,
        measureFn: (WeeklyGraphModel series, _) => series.financial,
        colorFn: (WeeklyGraphModel series, _) => series.color,
      ),
    ];

    return Consumer<WeekdataPerdayVM>(
      builder: (_, provider, __) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1, color: p1Color)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
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
                        children:  [
                          Text(//"Dec 7-13"
                           "${weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![0].myDate.toString().split(" ")[0] ?? ""}",
                          ),
                          Text("₹1200.00"),
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
                        children:  [
                          Text(
                            TOTAL_BOOKING,
                            style: TextStyle(
                                color: p1Color,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            totalBooking( weekdataPerdayVM.weekdataPerdayModel?.response!.online ?? 0,  weekdataPerdayVM.weekdataPerdayModel?.response!.offline ?? 0)
                            //weekdataPerdayVM.weekdataPerdayModel.response.weekdata[]
                            ,
                            style: TextStyle(
                                color: h1Color,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            ONLINE,
                            style: TextStyle(
                                color: p1Color,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            weekdataPerdayVM.weekdataPerdayModel?.response!.online.toString() ?? "",
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
                        children:  [
                          Text(
                            OFFLINE,
                            style: TextStyle(
                                color: p1Color,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(//"77",
                            weekdataPerdayVM.weekdataPerdayModel?.response!.offline.toString() ?? "",
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
