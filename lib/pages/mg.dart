import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queuesim/widgets/button2.dart';
import 'package:queuesim/widgets/getterforMg.dart';
import 'package:queuesim/widgets/mainHeading.dart';
import 'package:queuesim/widgets/subhead.dart';
import 'package:queuesim/widgets/subheading2.dart';
import 'package:queuesim/widgets/textfield.dart';

class MG extends StatelessWidget {
  TextEditingController abc = TextEditingController();
   MG({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body:Container(
          height: double.infinity,
          width: double.infinity,
                 decoration: BoxDecoration(   
                image: DecorationImage(             
                  image: AssetImage("assets/bubble.jpg")
                  ,fit: BoxFit.cover
                )
              ),
              child: MgGetter(),
              )
              ),
    );
  }
}