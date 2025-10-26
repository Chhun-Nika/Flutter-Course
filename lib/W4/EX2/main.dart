import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        decoration: BoxDecoration(color: Colors.blue[300]),
        margin: EdgeInsets.all(50.0),
        padding: EdgeInsets.all(40),

        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: const Center(
            child: Text(
              'CADT STUDENTS',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// why don't we used Scaffold widget here?
// -> since this exercise only displays text with backgound. However Scaffold is a widget this is used for the full screen of an app
// includes of app bar, floating button or even bottom bar and more.
