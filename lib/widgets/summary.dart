import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odometer/odometer.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/widgets/directInput.dart';
import 'package:queuesim/widgets/directInput1.dart';
import 'package:queuesim/widgets/heading3.dart';
import 'package:queuesim/widgets/hist.dart';
import 'package:queuesim/widgets/idlePerc.dart';
import 'package:queuesim/widgets/kendall.dart';
import 'package:queuesim/widgets/paragraph.dart';
import 'package:queuesim/widgets/percIndicator.dart';
import 'package:queuesim/widgets/subheading2.dart';
import 'package:queuesim/widgets/textfield.dart';

class Summary extends StatelessWidget {
  final String utilize;
  final String idle;
  final String lq;
  final String wq;
  final String ls;
  final String ws;
  const Summary({
    Key? key,
    required this.utilize,
    required this.idle,
    required this.lq,
    required this.wq,
    required this.ls,
    required this.ws,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromRGBO(207, 238, 251, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          Column(
                                              children: [
                                                Paragraph(
                                                    para: "Summary:",
                                                    R: 28,
                                                    G: 82,
                                                    B: 148),
                                                Divider(
                                                  color: Color.fromRGBO(
                                                      28, 82, 148, 1),
                                                  thickness: 1.0,
                                                ),
                                              ],
                                            ),
          SizedBox(
            height: 10.h,
          ),
          Container(
              child: subhead2(
                  heading:
                      "The total time in Percent that server works (rho): ${utilize}",
                  R: 28,
                  G: 82,
                  B: 142)),
          SizedBox(
            height: 10.h,
          ),
          Container(
              child: subhead2(
                  heading:
                      "The total time in Percent that remains idle is: ${idle}",
                  R: 28,
                  G: 82,
                  B: 142)),
          SizedBox(
            height: 10.h,
          ),
          Container(
              child: subhead2(
                  heading:
                      "Lq:Average Number of Customers in waiting line for service: ${lq}",
                  R: 28,
                  G: 82,
                  B: 142)),
          SizedBox(
            height: 10.h,
          ),
          Container(
              child: subhead2(
                  heading:
                      "Wq:Average time a Customer spends in waiting line for service: ${wq}",
                  R: 28,
                  G: 82,
                  B: 142)),
          SizedBox(
            height: 10.h,
          ),
          Container(
              child: subhead2(
                  heading:
                      "Ls:Average Number of Customers in the system (in waiting & being served): ${ls}",
                  R: 28,
                  G: 82,
                  B: 142)),
          SizedBox(
            height: 10.h,
          ),
          Container(
              child: subhead2(
                  heading:
                      "Ws:Average waiting time a Customer spends in the system: ${ws}",
                  R: 28,
                  G: 82,
                  B: 142)),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
