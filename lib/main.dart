import 'package:flutter/material.dart';

void main() {

  void onPress(){
    print("hello");
  }
  runApp(
    MaterialApp(
      title: 'My app',
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello"),
          SizedBox.shrink(),
          Expanded(child: Container(height: 200, color: Colors.amber,))
        ],
      ),
    ),
  );
}