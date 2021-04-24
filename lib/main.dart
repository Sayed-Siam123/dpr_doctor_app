import 'package:device_preview/device_preview.dart';
import 'package:dpr_doctor_app/UI/LoginPage/login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Utils/Constant.dart';
import 'Utils/Routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));  //to make top statusbar color transperent in app


  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) => runApp(DevicePreview(builder: (context) => MyApp(),enabled: !kReleaseMode,)));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.route,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Sk-Modernist",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
      // routes: {
      //   '/home': (context) => HomePage(),
      //   '/status': (context) => StatusPage(),
      // },
    );
  }
}

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.blue,
      seconds: 4,
      navigateAfterSeconds: LoginPage(),
      loadingText: Text("Loading",style: TextStyle(
          color: Colors.black
      ),),
      photoSize: 150.0,
      loaderColor: Colors.black,
    );
  }
}