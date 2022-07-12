import 'package:flutter/material.dart';
import 'package:queuesim/helpers/responsiveness.dart';
import 'package:queuesim/widgets/landingPageSmall.dart';
import 'package:queuesim/widgets/langingPage.dart';
import 'package:queuesim/widgets/largeDirectLanding.dart';
import 'package:queuesim/widgets/smallDirectLanding.dart';

class DirectLandingPage extends StatelessWidget {
  const DirectLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(largeScreen: LDL(), smallScreen: SDL());
  }
}
