import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
    this.text, {
    super.key,
    required this.start,
    required this.end,
  });

  final String text;
  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(colors: [start, end]),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}
