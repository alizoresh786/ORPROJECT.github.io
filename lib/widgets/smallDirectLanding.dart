import 'package:flutter/material.dart';

class SDL extends StatelessWidget {
  const SDL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
          )
          ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.red,
          )
          )  
      ],
    );
  }
}
