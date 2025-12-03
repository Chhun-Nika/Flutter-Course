import 'package:example/W9/QuizApp/lib/model/quiz.dart';
import 'package:example/W9/QuizApp/lib/ui/screens/question_screen.dart';
import 'package:example/W9/QuizApp/lib/ui/screens/result_screen.dart';
import 'package:example/W9/QuizApp/lib/ui/screens/start_screen.dart';
import 'package:flutter/material.dart';
 
enum ScreenType {startScreen, resultScreen, questionScreen}
class QuizApp extends StatefulWidget {
  final Quiz quiz;
  const QuizApp( {super.key, required this.quiz});


  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  ScreenType currentScreen = ScreenType.startScreen;

  Widget? getScreen (ScreenType screen) {
    switch (screen) {
      case ScreenType.startScreen:
        return StartScreen(onStartQuiz: () => onCurrentScreen(ScreenType.questionScreen),);
      case ScreenType.questionScreen:
        return QuestionScreen(quiz: widget.quiz, onLastQuestion: () => onCurrentScreen(ScreenType.resultScreen),);
      case ScreenType.resultScreen:
        return ResultScreen(quiz: widget.quiz, onPressed: () => onCurrentScreen(ScreenType.startScreen),);
    }
  }

  void onCurrentScreen (ScreenType newScreen) {
    setState(() {
      currentScreen = newScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF2196F3),
        body: Container(
          // padding: EdgeInsets.all(40),
          // margin: EdgeInsets.all(40),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     // Text('TODO !'),
          //     StartScreen()
          //   ],
          // ),
          // child: StartScreen(),
          child: getScreen(currentScreen),
        ),
      ),
    );
  }
}
