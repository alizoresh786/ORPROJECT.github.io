import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/pages/directDashboard.dart';
import 'package:queuesim/pages/layout.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/widgets/paragraph.dart';

class InDirectInputContainer1 extends StatelessWidget {
  final double val;
  final String Headval;
  final String Unitval;
  final int IR;
  final int IG;
  final int IB;
  const InDirectInputContainer1({
    Key? key,
    required this.val,
    required this.IR,
    required this.IG,
    required this.IB,
    required this.Headval,
    required this.Unitval
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.w,
      height: 190.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
              bottom: BorderSide( //                    <--- top side
                color: Color.fromRGBO(IR, IG, IB, 1),
                width: 3.0,
              ),
            ),
           
      ),
      child: Column(
        children: [
          Text("$Headval",style: GoogleFonts.raleway(
            fontSize: 7.sp, color: Color.fromRGBO(153, 153, 153, 1),letterSpacing: 2,wordSpacing: 4,),),
          
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                 val.toStringAsFixed(2),
        style: GoogleFonts.raleway(
            fontSize: 25.sp,color: Color.fromRGBO(IR, IG, IB, 1),letterSpacing: 2,wordSpacing: 4,fontWeight: FontWeight.bold),
        ),
              ),
          Paragraph(para: "$Unitval", R: 153, G: 153, B: 153),
            ],
          ),
        ],
      ),
    );
  }
}
