import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import './ui/WhatsAppHome.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WhatsApp",
      theme: ThemeData(
        primaryColor: const Color(0xff075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff25D366)),
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ SizedBox(
          height: 70.0,
          width: 70.0,
          child: Image.asset('assets/icon/whatsapp.png'),
        ),



      ],


),

      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
      pageTransitionType: PageTransitionType.leftToRight,


      nextScreen: WhatsAppHome(cameras: cameras)),
    );
  }
}