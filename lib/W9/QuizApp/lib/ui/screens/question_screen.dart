import 'package:example/W9/QuizApp/lib/model/quiz.dart';
import 'package:example/W9/QuizApp/lib/ui/widgets/question_widget.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final VoidCallback onLastQuestion;
  const QuestionScreen({
    super.key,
    required this.quiz,
    required this.onLastQuestion,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  List<Answer> answers = [];

  bool get isLastQuestion {
    return currentIndex == widget.quiz.questions.length - 1;
  }

  void onNextQuestion() {
    setState(() {
      currentIndex++;
    });
  }
  void onAnswerSelected (String answer) {
    answers.add(Answer(question: widget.quiz.questions[currentIndex], choice: answer));
    if (isLastQuestion) {
      widget.onLastQuestion();
      Submission submission = Submission(answers: answers);
      widget.quiz.submissions.add(submission);
      // print(submission.submissionId);
      // for (var answer in submission.answers) {
      //   print(answer.choice);
      // }
      // print(submission.getScore().toString());
      print(submission.getCorrectCount().toString());
    } else {
      onNextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return QuestionWidget(
      question: widget.quiz.questions[currentIndex],
      // onPressed: () =>
      //     isLastQuestion ? widget.onLastQuestion() : onNextQuestion(),
      onAnswerSelected: onAnswerSelected,
    );
  }
}
