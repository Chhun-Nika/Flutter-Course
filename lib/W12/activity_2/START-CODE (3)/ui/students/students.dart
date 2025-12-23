import 'package:example/W12/activity_2/START-CODE%20(3)/ui/students/student/student_details.dart';
import 'package:flutter/material.dart';

import '../../utils/animations_util.dart';

class Students extends StatelessWidget {
  const Students({super.key});
  
  onStudentSelected (String studentId, BuildContext context) async {
    await Navigator.of(context).push(
      AnimationUtils.createBottomToTopRoute(
        StudentDetails(studentId: studentId,)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final students = ["Ronan the BEST", "nika", "alyce"];
    return Scaffold(
      appBar: AppBar(title: Text("Student"), centerTitle: false),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(student),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              onStudentSelected(student, context);
            },
          );
        },
      ),
    );
  }
}
