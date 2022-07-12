import 'package:flutter/material.dart';
import 'package:queuesim/helpers/responsiveness.dart';
import 'package:queuesim/widgets/landingPageSmall.dart';
import 'package:queuesim/widgets/langingPage.dart';

class LayoutLanding extends StatelessWidget {
  const LayoutLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 246, 1),
      body: ResponsiveWidget(largeScreen:largeLanding(),smallScreen: smallLanding(),),
    );
  }
}
