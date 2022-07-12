import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Paragraph extends StatelessWidget {
  final String para;
  final int R;
  final int G;
  final int B;
  const Paragraph({
    Key? key, 
    required this.para,
    required this.R,
    required this.G,
    required this.B
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        style: GoogleFonts.raleway(
            fontSize: 10.sp, color: Color.fromRGBO(R, G, B, 1),letterSpacing: 2,wordSpacing: 4,),
        "$para");
  }
}
