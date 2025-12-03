import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  final bool isCorrect;
  final int number;
  const QuestionIdentifier({
    super.key,
    required this.isCorrect,
    required this.number,
  });

  Color? get backgroundColor =>
      isCorrect ? Color(0xFF92D051) : Color(0xFFC00000);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: backgroundColor,
      child: Text(number.toString(), style: TextStyle(color: Colors.white, fontSize: 22)),
    );
  }
}
