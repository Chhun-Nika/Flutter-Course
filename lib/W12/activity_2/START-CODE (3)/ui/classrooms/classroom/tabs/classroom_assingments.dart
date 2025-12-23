import 'package:flutter/material.dart';

class ClassroomAssingments extends StatelessWidget {
  const ClassroomAssingments({super.key, required this.classroomId});

  final String classroomId;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent[400],
      child: Center(child: Text("Feeds for classroom $classroomId")),
    );
  }
}
