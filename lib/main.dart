// @dart=2.9
import 'package:enr_regulations/Constatnts/userSheetsApi.dart';
import 'package:enr_regulations/Screens/Splash.dart';
import 'package:enr_regulations/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  await UserSheetsApi.init();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(EnrRegulation());
}

class EnrRegulation extends StatelessWidget {
  const EnrRegulation();

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
