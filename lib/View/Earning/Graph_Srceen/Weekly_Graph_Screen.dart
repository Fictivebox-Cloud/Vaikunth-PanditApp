import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Consts/text_const.dart';
import '../../../Consts/themescolor.dart';
import '../../../model/Graph_Model/Bar_Chart_Model.dart';
import '../../../view_model/Earnings_View_Model/GraphViewModel/WeekDayWiseDataVM.dart';

class WeeklyGraphScreen extends StatelessWidget {
  WeeklyGraphScreen({Key? key}) : super(key: key);
  late WeekdataPerdayVM weekdataPerdayVM;
 // WeekdataPerdayVM weekdataperday;

  final List<WeeklyGraphModel> data = [

    WeeklyGraphModel(
      my_date: "1",
      perdaybooking: 400,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
    WeeklyGraphModel(
      my_date: "2",
      perdaybooking: 250,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    WeeklyGraphModel(
      my_date: "3",
      perdaybooking: 300,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    WeeklyGraphModel(
      my_date: "4",
      perdaybooking: 100,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    WeeklyGraphModel(
      my_date: "5",
      perdaybooking: 450,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    WeeklyGraphModel(
      my_date: "6",
      perdaybooking: 630,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    WeeklyGraphModel(
      my_date: "7",
      perdaybooking: 950,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
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
        id: "perdaybooking",
        data: [

          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![0].myDate.toString() .split(" ")[0].replaceRange(0, 5, "")?? "",
            perdaybooking: weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![0].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(kPrimaryColor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![1].myDate.toString() .split(" ")[0].replaceRange(0, 5, "")?? "",
            perdaybooking: weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![1].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(kPrimaryColor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![2].myDate.toString() .split(" ")[0].replaceRange(0, 5, "")?? "",
            perdaybooking: weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![2].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(kPrimaryColor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![3].myDate.toString() .split(" ")[0].replaceRange(0, 5, "")?? "",
            perdaybooking:  weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![3].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(kPrimaryColor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![4].myDate.toString() .split(" ")[0].replaceRange(0, 5, "")?? "",
            perdaybooking:  weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![4].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(kPrimaryColor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![5].myDate.toString() .split(" ")[0].replaceRange(0, 5, "")?? "",
            perdaybooking:  weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![5].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(kPrimaryColor),
          ),
          WeeklyGraphModel(
            my_date: weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![6].myDate.toString() .split(" ")[0].replaceRange(0, 5, "")?? "",
            perdaybooking:  weekdataPerdayVM.weekdataPerdayModel?.response!.weekdata![6].perdaybooking ?? 0,
            color: charts.ColorUtil.fromDartColor(kPrimaryColor),
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
                            totalBooking( weekdataPerdayVM.weekdataPerdayModel?.response!.online ?? 0,  weekdataPerdayVM.weekdataPerdayModel?.response!.offline ?? 0),
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
