import 'package:example/W12/activity_2/START-CODE%20(3)/utils/animations_util.dart';
import 'package:flutter/material.dart';

import 'classroom/classroom_details.dart';

class Classrooms extends StatelessWidget {
  const Classrooms({super.key});

  onClassroomSelected (String classId, BuildContext context) async {
    await Navigator.of(context).push(
      AnimationUtils.createBottomToTopRoute(
        ClassroomDetails(classroomId: classId)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final classrooms = [
      'Flutter – Group 1',
      'Algorithms – Group 7',
      'Web Dev – Group 3',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Classrooms'), centerTitle: false,),
      body: ListView.builder(
        itemCount: classrooms.length,
        itemBuilder: (context, index) {
          final classroom = classrooms[index];

          return ListTile(
            leading: const Icon(Icons.class_),
            title: Text(classroom),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Go to the  ClassroomDetails
              onClassroomSelected(classroom, context);
            },
          );
        },
      ),
    );
  }
}
