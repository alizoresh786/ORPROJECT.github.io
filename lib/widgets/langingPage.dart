import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/pages/directLandingPage.dart';
import 'package:queuesim/pages/indirectLandingPage.dart';
import 'package:queuesim/widgets/button.dart';
import 'package:queuesim/widgets/paragraph.dart';

class largeLanding extends StatelessWidget {
  const largeLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>((context), listen: false);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Color.fromRGBO(67, 162, 220, 1)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Paragraph(
                        para:
                            "On selecting this, it will give you six types\n\nof queue models, you have to select one option\n\nof them ,then it requires further info from you.. ",
                        R: 255,
                        G: 255,
                        B: 255),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      child: Button1(text: "Direct", R: 255, G: 255, B: 255),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DirectLandingPage()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Paragraph(
                        para:
                            "It requires indiviual arrivals and service ,you\n\nyou should give atleast 20 observations ,It simulates\n\nyour system & estimates each component of system.. ",
                        R: 67,
                        G: 162,
                        B: 220),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      child: Button1(text: "Indirect", R: 67, G: 162, B: 220),
                      onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Indirect()));
                        state.ServiceTime();
                      },
                    ),
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
