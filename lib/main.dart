import 'package:flutter/material.dart';
import 'package:mess_application_qr_scanner/qr_scan_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Induced MessSystem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const QRScanPage(),
    );
  }
}

