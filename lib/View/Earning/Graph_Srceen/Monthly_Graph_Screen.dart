import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../../../Consts/text_const.dart';
import '../../../Consts/themescolor.dart';

import '../../../model/Graph_Model/Monthly_Graph_Model.dart';

class MonthlyGraphScreen extends StatelessWidget {
  MonthlyGraphScreen({Key? key}) : super(key: key);

  final List<MonthlyGraphModel> data = [
    MonthlyGraphModel(
      year: "Week 1",
      financial: 250,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    MonthlyGraphModel(
      year: "Week 2",
      financial: 300,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    MonthlyGraphModel(
      year: "Week 3",
      financial: 100,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    MonthlyGraphModel(
      year: "Week 4",
      financial: 450,
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<MonthlyGraphModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (MonthlyGraphModel series, _) => series.year,
        measureFn: (MonthlyGraphModel series, _) => series.financial,
        colorFn: (MonthlyGraphModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1, color:p1Color)),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16, right: 16, top: 10),
          child:
          Column(
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                  ),
                  Column(
                    children: const [
                      Text("Dec 7-13"),
                      Text("₹1200.00"),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
              Expanded(child: charts.BarChart(
                series,
                animate: true,
              ),),
              Divider(color:dividerr,thickness: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(TOTAL_BOOKING,style:TextStyle(color: p1Color,fontSize: 12, fontWeight: FontWeight.w400),),
                      Text("20",style:TextStyle(color: h1Color,fontSize: 16, fontWeight: FontWeight.w600),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(ONLINE,style:TextStyle(color: p1Color,fontSize: 12, fontWeight: FontWeight.w400),),
                      Text("12",style:TextStyle(color: h1Color,fontSize: 16, fontWeight: FontWeight.w600),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(OFFLINE,style:TextStyle(color: p1Color,fontSize: 12, fontWeight: FontWeight.w400),),
                      Text("8",style:TextStyle(color: h1Color,fontSize: 16, fontWeight: FontWeight.w600),),
                    ],
                  ),                                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
