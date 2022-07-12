import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queuesim/widgets/button2.dart';
import 'package:queuesim/widgets/mainHeading.dart';

class TexttField extends StatelessWidget {
  final Controller;
  const TexttField({Key? key, required this.Controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:Controller ,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),],
        style: TextStyle(color: Colors.blue),
        cursorColor: Colors.blue,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1),
          ),
        ));
  }
}




