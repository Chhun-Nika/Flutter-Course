import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 100),
              Container(height: 400, color: Colors.blue),

              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Container(color: Colors.green)),
                    Container(width: 100, color: Colors.pink),
                  ],
                ),
              ),

              Container(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(flex: 1, child: Container(color: Colors.yellow,)),
                    const SizedBox(width: 20),
                    Expanded(flex: 1, child: Container(color: Colors.yellow, )),
                    const SizedBox(width: 20),
                    Expanded(flex: 1, child: Container(color: Colors.yellow)),
                    
                  ],
                ),
              ),

              const SizedBox(height: 20,),
              Expanded(child: Container(color: Colors.pink,))
            ],
          ),
        ),
      ),
    ),
  );
}
