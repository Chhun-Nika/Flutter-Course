import 'package:example/W5/Lab/EX3/product_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Products"), centerTitle: false),
        body: Container(
          decoration: BoxDecoration(color: Color(0xFF009AFA)),
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Card(
              //   color: Colors.white,
              //   // this one will clip the content, this img contains bg
              //   clipBehavior: Clip.hardEdge,
              //   child: Padding(
              //     padding: EdgeInsetsGeometry.all(20),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Image.asset('assets/ex3/dart.png', height: 100),
              //         Text('Dart', style: TextStyle(fontSize: 36),),
              //         Text('the best object langauge'),
              //       ],
              //     ),
              //   ),
              // ),
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase)
              
            ],
          ),
        ),
      ),
    );
  }
}
