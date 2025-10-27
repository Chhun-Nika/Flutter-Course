import 'package:example/W5/activity1/gradient_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              GradientButton("Hello 1", start: Color(0xFF4E7DF5), end: Color(0xFF0B3CBD)),
              GradientButton("Hello 2", start: Color(0xFF4E7DF5), end: Color(0xFF0B3CBD)),
              GradientButton("Hello 3", start: Color(0xFF4E7DF5), end: Color(0xFF0B3CBD))
            ],
          ),
        ),
      ),
    ),
  );
}