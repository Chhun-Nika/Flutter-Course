import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final double totalPrice;
  const CategoryCard({super.key, required this.icon, required this.totalPrice});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(icon),
      const SizedBox(height: 10,),
      Text("\$${totalPrice.toString()}")
    ],);
  }
}
