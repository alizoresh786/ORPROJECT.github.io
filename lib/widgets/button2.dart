import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Button2 extends StatelessWidget {
  final String text;
  final int R;
  final int G;
  final int B;
  const Button2({
    Key? key,
    required this.text,
    required this.R,
    required this.G,
    required this.B
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 60.h,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(R, G, B, 1),width: 5.0,),
        color: Colors.transparent,   
      ),
      child:Center( 
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              style: GoogleFonts.openSans(
                fontSize: 8.sp, color: Color.fromRGBO(R, G, B, 1)),
              "$text"
            ),
            Icon(Icons.arrow_forward , color: Color.fromRGBO(R, G, B, 1),)
          ],
        ) ,
      ),
    );
  }
}