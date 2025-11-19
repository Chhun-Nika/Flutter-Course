import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Color(0xFF9DD635)),
          child: ListView(
            children: [
              ScoreCard(course: "Flutter", child: ScoreManagement(initialScore: 3),),
              ScoreCard(course: "Dart", child: ScoreManagement(initialScore: 4),),
              ScoreCard(course: "React", child: ScoreManagement(),),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatelessWidget {
  final String course;
  final Widget child;
  // final int initialScore;

  const ScoreCard({super.key, required this.course, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            "My Score in $course",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 10),
          child
          // ScoreManagement(initialScore: initialScore),
        ],
      ),
    );
  }
}

class ScoreManagement extends StatefulWidget {
  const ScoreManagement({super.key, this.initialScore = 1});
  final int initialScore;

  @override
  State<ScoreManagement> createState() => _ScoreManagementState();
}

class _ScoreManagementState extends State<ScoreManagement> {
  // set fixed width to easier calculate the progress bar when it is increment or decrement
  double width = 400;
  int maxScore = 10;
  late int currentScore = widget.initialScore;

  double get progressScore => (width / maxScore) * currentScore;
  Color get scoreBarColor {
    if (currentScore >= 1 && currentScore <= 4) {
      return Color(0xFF69C97C);
    } else if (currentScore >= 5 && currentScore <= 7) {
      return Color(0xFF00B141);
    } else if (currentScore >= 8 && currentScore <= 10) {
      return Color(0xFF006014);
    }
    // this will never return grey since the setState has its limit
    // and the btn is disable if the currentScore is below 0 or greater than 10
    return Colors.grey;
  }

  // calculate the width based on the initail score
  void addScore() {
    setState(() {
      if (currentScore < 10) {
        currentScore++;
      }
    });
  }

  void deductScore() {
    setState(() {
      if (currentScore > 1) {
        currentScore--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: currentScore > 1 ? deductScore : null,
              icon: Icon(Icons.remove),
            ),
            IconButton(onPressed: currentScore < 10 ? addScore : null, icon: Icon(Icons.add)),
          ],
        ),
        const SizedBox(height: 20),
        Stack(
          children: [
            Container(
              height: 60,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              height: 60,
              width: progressScore,
              decoration: BoxDecoration(
                color: scoreBarColor,
                // border: Border.all(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
