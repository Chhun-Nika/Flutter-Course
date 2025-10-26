import 'package:example/W4/EX4/custom_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            CustomCard(text: "OOP", colors: [Colors.blue[100]!],),
            CustomCard(text: "DART", colors: [Colors.blue[300]!]),
            CustomCard(text: "FLUTTER", colors: [Color(0xFF5FB1F5), Color(0xFF2B1B77)],)
          ],
        ),
      ),
    ),
  );
}
