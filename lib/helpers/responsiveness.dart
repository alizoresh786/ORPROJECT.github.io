import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  
  final Widget smallScreen;
  ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
    
      required this.smallScreen})
      : super(key: key);
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < smallScreenSize;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize &&
      MediaQuery.of(context).size.width < smallScreenSize;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      double _width  = constraints.maxWidth;
      if(_width >= largeScreenSize){
        return largeScreen;
      }
      // else if (_width < largeScreenSize && _width >= mediumScreenSize){
      //   return mediumScreen;
      // }
      else{
        return largeScreen;
      }
    });
  }
}
