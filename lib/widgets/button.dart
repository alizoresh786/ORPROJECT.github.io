import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Button1 extends StatelessWidget {
  final String text;
  final int R;
  final int G;
  final int B;
  const Button1({
    Key? key,
    required this.text,
    required this.R,
    required this.G,
    required this.B
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(R, G, B, 1),width: 5.0,),
        color: Colors.transparent,   
      ),
      child:Center( 
        child:Text(
          style: GoogleFonts.openSans(
            fontSize: 12.sp, color: Color.fromRGBO(R, G, B, 1)),
          "$text"
        ) ,
      ),
    );
  }
}
