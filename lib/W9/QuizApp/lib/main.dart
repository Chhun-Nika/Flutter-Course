import 'package:example/W9/QuizApp/lib/model/quiz.dart';
import 'package:flutter/material.dart';
import 'ui/quiz_app.dart';

void main() {
  // 1 - Load the quiz data
  // String filePath = "example/lib/W9/QuizApp/lib/data/quiz.json";
  // QuizRepository test = QuizRepository(filePath: filePath);
  // Quiz quiz = test.readQuiz();
  List<Question> questions = [
    Question(
      title: "What language is primarily used to write Flutter apps?",
      choices: ["Java", "Dart", "C", "Python"],
      corrrectAnswer: "Dart",
    ),
    Question(
      title: "What is the capital of France?",
      choices: ["Rome", "Phnom Penh", "Paris", "Seoul"],
      corrrectAnswer: "Paris",
    ),
  ];

  Quiz quiz = Quiz(questions: questions);

  // 2 - Display the quiz
  runApp(QuizApp(quiz: quiz));
}
