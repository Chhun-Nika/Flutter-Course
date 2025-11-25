import 'package:example/W8/lab/EXERCISE-3/ui/screens/temperature_screen.dart';
import 'package:flutter/material.dart';

import 'ui/screens/welcome_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isWelcomePage = true;

  void handleTapChange(bool newValue) {
    setState(() {
      isWelcomePage = newValue;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: Visibility(visible: !active, child: WelcomeScreen(onChange: handleTapChange)),
          child: isWelcomePage
              ? WelcomeScreen(onChange: handleTapChange, )
              : TemperatureScreen(onChange: handleTapChange,),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
