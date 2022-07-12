import 'package:flutter/material.dart';
import 'package:queuesim/widgets/paragraph.dart';

class smallLanding extends StatelessWidget {
  const smallLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(67, 162, 220, 1) 
              ),
              child: Center(
                child:  Column(  
                  children: [
                    Paragraph(
                      para: "this is abdul sami", 
                      R: 255, 
                      G: 255, 
                      B: 255)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Center(
                child:  Column(  
                  children: [
                    Paragraph(
                      para: "this is abdul sami", 
                      R: 67, 
                      G: 162, 
                      B: 220)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
