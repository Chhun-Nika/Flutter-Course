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
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.title,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
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
