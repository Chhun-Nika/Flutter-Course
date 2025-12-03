// import 'dart:convert';
// import 'dart:io';
// import 'package:example/W9/QuizApp/lib/model/quiz.dart';
// import 'package:path_provider/path_provider.dart';

// class QuizRepository {
//   final String fileName;
//   QuizRepository({required this.fileName});

//   Quiz readQuiz() {
//     // final file = File(filePath);
//     Future<File> getLocalFile() async {
//       final directory = await getApplicationDocumentsDirectory();


//     }
//     final content = file.readAsStringSync();
//     Map<String, dynamic> quizJson = jsonDecode(content);

//     var questionsJson = quizJson['questions'] as List;
//     var questions = questionsJson.map((q) {
//       return Question(
//         title: q['title'],
//         choices: List<String>.from(q['choices']),
//         corrrectAnswer: q['correctAnswer'],
//       );
//     }).toList();

//     var submissionsJson = quizJson['submissions'] as List;
//     var submissions = submissionsJson.map((s) {
//       return Submission(
//         submissionId: s['submissionId'],
//         answers: s['answers']
//       );
//     }).toList();
//     return Quiz(questions: questions, submissions: submissions);

//   }

//   void writeQuiz(Quiz quiz) {
//     final file = File(filePath);
//     final content = file.readAsStringSync();
//     Map<String, dynamic> data = jsonDecode(content);
//     final questionsJson = questionToJson(quiz);
//     data['questions'] = questionsJson['questions'];

//     // if (quiz.submissions.isNotEmpty) {
//     //   final submissionsJson = submissionToJson(quiz);
//     //   data['submissions'] = submissionsJson['submissions'];
//     // }
//   }

//   Map<String, dynamic> questionToJson(Quiz quiz) {
//     return {
//       "questions": quiz.questions.map((q) {
//         return {
//           "questionsId": q.questionId,
//           "title": q.title,
//           "choices": q.choices,
//           "correctAnswer": q.corrrectAnswer,
//         };
//       }).toList(),
//     };
//   }

//   // Map<String, dynamic> submissionToJson(Quiz quiz) {
//   //   return {
//   //     "submissions": quiz.submissions.map((s) {
//   //       var answersJson = 
//   //     }).toList(),
//   //   };
//   // }
// }
