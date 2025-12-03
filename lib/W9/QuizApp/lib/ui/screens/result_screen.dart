import 'package:example/W9/QuizApp/lib/model/quiz.dart';
import 'package:example/W9/QuizApp/lib/ui/widgets/button_widget.dart';
import 'package:example/W9/QuizApp/lib/ui/widgets/result_widget.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onPressed;
  const ResultScreen({super.key, required this.quiz, required this.onPressed});

  Widget getResult(int index) {
    Submission latestSubmission = quiz.submissions[quiz.submissions.length - 1];
    Question currentQuestion = quiz.questions[index];
    String answer = latestSubmission.answers[index].choice;
    return ResultWidget(
      index: index,
      question: currentQuestion,
      isCorrect: latestSubmission.answers[index].isGoodAnswer(currentQuestion),
      answer: answer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            "Correct answers: ${quiz.submissions[quiz.submissions.length - 1].getCorrectCount()} / ${quiz.submissions[quiz.submissions.length - 1].answers.length}",
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.lightGreen, borderRadius: BorderRadius.circular(10)),
            child: Text("Score: ${quiz.submissions[quiz.submissions.length - 1].getScore()} points", style: TextStyle(color: Colors.white),),
          ),
          const SizedBox(height: 40),
          ListView.builder(
            // the shrinkwrap is used to make sure the listView only take the height it needs
            shrinkWrap: true,
            itemCount: quiz.questions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: getResult(index),
              );
            },
          ),
          const SizedBox(height: 40),
          ButtonWidget(buttonText: "Restart Quiz", onPressed: onPressed)
        ],
      ),
    );
  }
}
