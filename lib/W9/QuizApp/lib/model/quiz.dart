import 'package:uuid/uuid.dart';

var uuid = Uuid();

// class Quiz {
//   final String quizId;
//   final List<Question> questions;
//   final List<Answer> answers;

//   Quiz({String? quizId, required this.questions, required this.answers})
//     : quizId = quizId ?? uuid.v4();

//   void addAnswer(Answer answer) {
//     answers.add(answer);
//   }
// }
class Quiz {
  final List<Question> questions;
  final List<Submission> submissions;

  Quiz({required this.questions, List<Submission>? submissions}) : submissions = submissions ?? [];

  void addSubmission(Submission submission) {
    submissions.add(submission);
  }
}

class Question {
  final String questionId;
  final String title;
  final List<String> choices;
  final String corrrectAnswer;
  final int score;

  Question({
    String? questionId,
    required this.title,
    required this.choices,
    required this.corrrectAnswer,
    int? score,
  }) : questionId = questionId ?? uuid.v4(),
       score = score ?? 10;

}

class Answer {
  final String answerId;
  final Question question;
  final String choice;

  Answer({String? answerId, required this.question, required this.choice})
    : answerId = answerId ?? uuid.v4();

  bool isGoodAnswer(Question question) {
    if (question.corrrectAnswer == choice) {
      return true;
    } else {
      return false;
    }
  }
}

class Submission {
  final String submissionId;
  final List<Answer> answers;

  Submission({String? submissionId, List<Answer>? answers})
    : submissionId = submissionId ?? uuid.v4(),
      answers = answers ?? [];

    void addAnswer (Answer anwser) {
      answers.add(anwser);
    }

  int getScore () {
    int totalScore = 0;
    for(var answer in answers) {
      if (answer.isGoodAnswer(answer.question)) {
        totalScore += answer.question.score;
      }
    }
    return totalScore;
  }

  int getCorrectCount () {
    int totalNumber = 0;
    for(var answer in answers) {
      if (answer.isGoodAnswer(answer.question)) {
        totalNumber++;
      }
    }
    return totalNumber;
  }
}
