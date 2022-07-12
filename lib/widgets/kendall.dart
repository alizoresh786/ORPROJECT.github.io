import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/pages/directDashboard.dart';
import 'package:queuesim/pages/layout.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/widgets/paragraph.dart';

class Kendal extends StatelessWidget {
   final String val;
  final String Headval;
  final int KR;
  final int KG;
  final int KB;
  const Kendal({Key? key,
  required this.val,
    required this.KR,
    required this.KG,
    required this.KB,
    required this.Headval,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.w,
      height: 170.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
              bottom: BorderSide( //                    <--- top side
                color: Color.fromRGBO(KR, KG, KB, 1),
                width: 3.0,
              ),
            ),
           
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Paragraph(para: "$Headval", R: 153, G: 153, B: 153),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
        style: GoogleFonts.raleway(
            fontSize: 14.sp,color: Color.fromRGBO(KR, KG, KB, 1),letterSpacing: 2,wordSpacing: 4,fontWeight: FontWeight.bold),
        "$val"),
              ),
          // Paragraph(para: "minutes", R: 153, G: 153, B: 153),
            ],
          ),
        ],
      ),
    );
  }
}
