import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 4)).then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Calculadora de IMC", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        ],
      )
    );
  }
}
