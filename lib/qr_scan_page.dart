import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';

class QRScanPage extends StatefulWidget {

  const QRScanPage({Key? key}) : super(key: key);

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  late QRViewController controller;
  late String result;

  var stats;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).primaryColor, width: 5.0)),
          height: 300.0,
          width: 300.0,
          child: buildQRView(context),
        ),
      ),
    );
  }

  Widget buildQRView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      formatsAllowed: const [],
    );
  }

  void onQRViewCreated(QRViewController controller) {

    setState(() {
      FlutterTts flutterTTs = FlutterTts();
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) async {
        controller.pauseCamera();
        result = scanData.code;
        final ish = await http
            .get(Uri.parse("https://inducedmess.vercel.app/checker?idp=$result)"));
        if (ish.statusCode == 200) {
          stats = (ish.body);
        }
        else{
          stats = "Issue in Api";
        }
        await flutterTTs.setLanguage("en-US");
        await flutterTTs.setPitch(1.5);
        await flutterTTs.setSpeechRate(0.5);
        await flutterTTs.speak(stats);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Welcome'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('$stats'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ).then((value) => controller.resumeCamera());
      }
          // setState(() {
          //   result = scanData.code;
          //   // ignore: avoid_print
          //   http.post(Uri.parse("https://inducedapi.vercel.app/cc?idp="+result)).then((value) => print(value.request.toString()));
          // }
          );
    });
  }
}
