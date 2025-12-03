import 'package:example/W9/QuizApp/lib/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  // fbool isButtonClick = false;
  final VoidCallback onStartQuiz;
  const StartScreen({super.key, required this.onStartQuiz});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/w9/quiz-logo.png", height: 400),
          ButtonWidget(buttonText: "Start Quiz", onPressed: onStartQuiz,)
          
        ],
      ),
      // child: QuestionWidget(),
    );
  }
}


