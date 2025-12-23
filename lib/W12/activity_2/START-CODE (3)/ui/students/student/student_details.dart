import 'package:flutter/material.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key, required this.studentId});

  final String studentId;

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.studentId), centerTitle: false,),
      body: Container(
        color: Colors.redAccent,
        child: Center(child: Text(widget.studentId)),
      ),
    );
  }
}