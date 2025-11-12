import 'package:flutter/material.dart';

enum Product {
  dart("Dart", "the best object langauge", "assets/ex3/dart.png"),
  flutter(
    "Flutter",
    "the best mobile widget library",
    "assets/ex3/flutter.png",
  ),
  firebase("Firebase", "the best cloud database", "assets/ex3/firebase.png");

  final String title;
  final String description;
  final String image;
  const Product(this.title, this.description, this.image);
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // this one will clip the content, this img contains bg
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image, height: 100),
            Text(product.title, style: TextStyle(fontSize: 36)),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
