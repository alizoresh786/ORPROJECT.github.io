import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/pages/directDashboard.dart';
import 'package:queuesim/pages/layout.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/widgets/paragraph.dart';

class IdlePerc extends StatelessWidget {
   final double idleTime;
   IdlePerc({Key? key, required this.idleTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      animationDuration: 1200,
      percent: idleTime,
      width: 200.0,
      lineHeight: 9.0,
      linearStrokeCap: LinearStrokeCap.round,
      progressColor: Colors.amber,
    );
  }
}
