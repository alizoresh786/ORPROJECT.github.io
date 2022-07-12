import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/pages/directDashboard.dart';
import 'package:queuesim/pages/layout.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/widgets/paragraph.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Hist extends StatelessWidget {
  const Hist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    List<charts.Series<XYDATA, String>> series = [
      charts.Series(
          id: "Financial",
          data: state.MergeXY,
          domainFn: (XYDATA series, _) => series.X.toString(),
          measureFn: (XYDATA series, _) => series.Y,
          labelAccessorFn: (XYDATA series, _) => " ,series.Y,"),
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              Paragraph(para: "Probability Of n Persons:", R: 153, G: 153, B: 153),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

