import 'package:example/W9/QuizApp/lib/model/quiz.dart';
import 'package:example/W9/QuizApp/lib/ui/widgets/question_identifier.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final Question question;
  final bool isCorrect;
  final int index;
  final String answer;
  const ResultWidget({
    super.key,
    required this.question,
    required this.isCorrect,
    required this.index,
    required this.answer,
  });
  Color userAnswerColor(String value) {
    if (value == answer && value == question.corrrectAnswer) {
      return Color(0xFF92D051);
    } else if (value == answer && value != question.corrrectAnswer) {
      return Color(0xFFC00000);
    } else {
      return Colors.black;
    }
  }

  FontWeight getFontWeight(String value) {
    if (value == answer) {
      return FontWeight.bold;
    } else {
      return FontWeight.normal;
    }
  }

  IconData? getIcon(String value) {
    if (value == question.corrrectAnswer) {
      return Icons.check;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            QuestionIdentifier(isCorrect: isCorrect, number: index + 1),
            const SizedBox(width: 20),
            Expanded(
              child: Text(question.title, style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            ...question.choices.map(
              (c) => Container(
                  padding: EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      Icon(getIcon(c)),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          c,
                          style: TextStyle(
                            fontSize: 18,
                            color: userAnswerColor(c),
                            fontWeight: getFontWeight(c),
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
