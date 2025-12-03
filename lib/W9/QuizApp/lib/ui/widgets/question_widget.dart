import 'package:example/W9/QuizApp/lib/model/quiz.dart';
import 'package:example/W9/QuizApp/lib/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  // final VoidCallback onPressed;
  final ValueChanged<String> onAnswerSelected;
  const QuestionWidget({
    super.key,
    required this.question,
    // required this.onPressed,
    required this.onAnswerSelected,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   "${question.title} (${question.score} points)",
          //   style: TextStyle(fontSize: 26, color: Colors.white),
          // ),
          RichText(text: TextSpan(
            style: TextStyle(fontSize: 26, color: Colors.white),
            children: [
            TextSpan(text: question.title),
            TextSpan(text: " (${question.score} points)", style: TextStyle(color: Color.fromARGB(255, 39, 47, 204), fontWeight: FontWeight.bold))
          ])),
          const SizedBox(height: 70),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 40,
            children: [
              // ...question.choices.map(
              //   (choice) => ButtonWidget(buttonText: choice, onPressed: () => print("hello"),),
              // ),
              for (var i = 0; i < question.choices.length; i++)
                ButtonWidget(
                  buttonText: question.choices[i],
                  onPressed: () => onAnswerSelected(question.choices[i]),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
