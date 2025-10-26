import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.text, this.colors = const [Colors.blue]});

  final String text;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // since LinearGradient must have at least 2 colors
        // to prevent this use the ternary operator to check the lenght of color's list
        color: colors.length == 1 ? colors[0] : null,
        gradient: colors.length > 1 ? LinearGradient(colors: colors) : null,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
