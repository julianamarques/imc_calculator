import 'package:flutter/material.dart';
import 'screens/splash.dart';

void main() => runApp(ImcCalculator());

class ImcCalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      theme: ThemeData(
        primarySwatch:
          Colors.green,
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 30),
            title: TextStyle(fontSize: 36, fontWeight: FontWeight.bold))
      ),
      home: Splash(),
    );
  }
}
