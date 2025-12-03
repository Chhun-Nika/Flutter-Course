import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const ButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Color(0xFF92CCF9), offset: Offset(8, 8))],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(top: 30, bottom: 30, left: 50, right: 50),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.blueGrey, fontSize: 26),
        ),
      ),
    );
  }
}
