import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;

  const HobbyCard({
    super.key,
    required this.text,
    required this.icon,
    Color? inputColor,
  }) : color = inputColor ?? Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(icon, color: Colors.white),
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
