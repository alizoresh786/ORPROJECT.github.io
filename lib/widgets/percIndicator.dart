import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/pages/directDashboard.dart';
import 'package:queuesim/pages/layout.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/widgets/heading3.dart';
import 'package:queuesim/widgets/paragraph.dart';
import 'package:queuesim/widgets/subhead.dart';
import 'package:queuesim/widgets/subheading2.dart';

class ServerBusy extends StatelessWidget {
  final double busyTime;
   ServerBusy({Key? key,required this.busyTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 1200,
      radius: 90.0,
      lineWidth: 20.0,
      percent: busyTime,
      center:  Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
        subhead2(heading: "Utilization", R: 153, G: 153, B: 153),
        Head3(heading:(busyTime*100).toStringAsFixed(2)+'%' , R: 255, G: 193, B: 7),
      ],),
      progressColor: Colors.amber,
      circularStrokeCap: CircularStrokeCap.butt,
    );
  }
}
