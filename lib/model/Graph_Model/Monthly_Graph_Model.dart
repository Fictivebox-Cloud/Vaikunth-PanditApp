import 'package:charts_flutter_new/flutter.dart' as charts;

class MonthlyGraphModel {
  String year;
  int financial;
  final charts.Color color;

  MonthlyGraphModel({
    required this.year,
    required this.financial,
    required this.color,
  });
}
