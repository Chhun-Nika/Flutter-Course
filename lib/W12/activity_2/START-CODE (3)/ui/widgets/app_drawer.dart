import 'package:example/W12/activity_2/START-CODE%20(3)/ui/profile/profile.dart';
import 'package:flutter/material.dart';

import '../../utils/animations_util.dart';
import '../classrooms/classrooms.dart';
import '../students/students.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  onClassroomPageSelected(BuildContext context) async {
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(Classrooms()));
  }

  onStudentPageSelected(BuildContext context) async {
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(Students()));
  }

  onProfilePageSelected(BuildContext context) async {
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(Profile()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text("Classrooms"),
          onTap: () {
            onClassroomPageSelected(context);
          },
        ),
        ListTile(
          title: Text("Students"),
          onTap: () {
            onStudentPageSelected(context);
          },
        ),
        ListTile(
          title: Text("Profile"),
          onTap: () {
            onProfilePageSelected(context);
          },
        ),
      ],
    );
  }
}
