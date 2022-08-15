import 'package:flutter/material.dart';
import 'package:whatsapp_ui/ui/WhatsAppHome.dart';

import 'main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(const Duration(milliseconds: 1500), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WhatsAppHome(cameras: cameras)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
           Padding( padding: EdgeInsets.symmetric(vertical: 180.0)),
            SizedBox(
             height: 80,
             width: 80,
             child: AnimatedSwitcher(
               child: Image(
                   image: AssetImage('assets/icon/whatsapp.png'),
                   key: ValueKey('assets/icon/whatsapp.png')),
               duration: Duration(seconds: 1),
             ),
              ),
            Padding(padding:EdgeInsets.all(20)),
            Expanded(child:
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('YAKSHIT', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
            ),),
          ],
      ),
      ),
    );
  }
}

