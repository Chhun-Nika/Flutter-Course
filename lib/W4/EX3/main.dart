import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        decoration: BoxDecoration(color: Color(0XFFE0E0E0)),
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(
                child: Text(
                  'OOP',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: const Center(
                child: Text(
                  'DART',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                // gradient
                gradient: LinearGradient(
                  colors: [Color(0xFF5FB1F5), Color(0xFF2B1B77)],
                ),
                // using color share, the above is using the hexa value (8-digits)
                // gradient: LinearGradient(colors: [Colors.blue[200]!, Colors.blue[600]!])
              ),
              child: const Center(
                child: Text(
                  'FLUTTER',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

