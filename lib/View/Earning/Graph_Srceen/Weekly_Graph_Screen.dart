import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../../../Consts/text_const.dart';
import '../../../Consts/themescolor.dart';
import '../../../model/Graph_Model/Bar_Chart_Model.dart';

class Weekly_Graph_Screen extends StatelessWidget {
  Weekly_Graph_Screen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    List<charts.Series<WeeklyGraphModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (WeeklyGraphModel series, _) => series.year,
        measureFn: (WeeklyGraphModel series, _) => series.financial,
        colorFn: (WeeklyGraphModel series, _) => series.color,
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
