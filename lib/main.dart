import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queuesim/controllers/stateProvider.dart';
import 'package:queuesim/pages/directDashboard.dart';
import 'package:queuesim/pages/layout.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child)=> ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: "Dashboard",
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(240, 242, 246, 1),
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme
        ).apply(
          bodyColor: Colors.black
        ),
        pageTransitionsTheme: PageTransitionsTheme(builders:{
          TargetPlatform.iOS:FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android:FadeUpwardsPageTransitionsBuilder(),
        }
        ),
        primaryColor: Color.fromRGBO(240, 242, 246, 1),
      ),
      // home:DirectDashboard(),
    home: LayoutLanding(),
    
    ),
    
      ),
      designSize: Size(768, 1366),
      
      );
      
  }
  
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}


