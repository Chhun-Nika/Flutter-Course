import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [DiscountCard(initialPrice: 100, discountRate: 0.1)],
        ),
      ),
    );
  }
}

class DiscountCard extends StatefulWidget {
  const DiscountCard({
    super.key,
    required this.initialPrice,
    required this.discountRate,
  });

  final int initialPrice;
  final double discountRate; // range of discount 0-1, example: 0.25 = 25 %

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  bool appliedDiscount = false;

  Color get cardColor => appliedDiscount ? Colors.pink : Color(0xFF2D2C2C);
  String get labelText => appliedDiscount ? "Discount!" : "No Discount!";
  String get buttonLabel =>
      appliedDiscount ? "Cancel Discount" : "Apply Discount";
  int get discountPrice => appliedDiscount
      ? ((1 - widget.discountRate) * widget.initialPrice).floor()
      : widget.initialPrice;

  String get priceLabel => "\$ $discountPrice";

  void onDiscount() {
    setState(() {
      appliedDiscount = !appliedDiscount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 10,
        children: [
          Text(priceLabel, style: TextStyle(color: Color(0xFFE7DEEE), fontSize: 20),),
          Text(labelText),
          ElevatedButton(onPressed: onDiscount, child: Text(buttonLabel)),
        ],
      ),
    );
  }
}
