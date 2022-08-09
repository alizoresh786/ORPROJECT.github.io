import 'package:flutter/material.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Hist3 extends StatefulWidget {
  const Hist3({Key? key}) : super(key: key);

  @override
  State<Hist3> createState() => _Hist3State();
}

class _Hist3State extends State<Hist3> {
late TooltipBehavior _tooltipBehavior;

    @override
    void initState() {
      _tooltipBehavior = TooltipBehavior(enable: true);
      super.initState();
    }
    @override
  Widget build(BuildContext context) {
     var state = Provider.of<AppState>((context), listen: false);
     return Container(
        child: SfCartesianChart(

              tooltipBehavior: _tooltipBehavior,
      
          title: ChartTitle(
                  text: 'Arrival analysis',
                  backgroundColor: Colors.white,
                  borderColor: Colors.blue,
                  borderWidth: 2,
                  // Aligns the chart title to left
                  alignment: ChartAlignment.near,
                  textStyle: TextStyle(
                    color: Colors.teal,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                  )
                ),
                palette: <Color>[
                            Colors.teal,],
          series: <ChartSeries>[
      HistogramSeries<HISTDATA_ARRIVAL, double>(
          enableTooltip: true, 
          dataSource: state.histDataArrival,
          width: 0.5,
          showNormalDistributionCurve: true,
          curveColor: const Color.fromRGBO(192, 108, 132, 1),
          binInterval: 10,
          yValueMapper: (HISTDATA_ARRIVAL data, _) => data.Y,
      )
          
    ]));
  }
}

