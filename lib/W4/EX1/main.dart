import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: Text('Welcome!')),
        body: const Center(
          child: Text(
            'Hello my name is nika!',
            style: TextStyle(color: Colors.orange, fontSize: 50),
          ),
        ),
      ),
    ),
    
  );
}
