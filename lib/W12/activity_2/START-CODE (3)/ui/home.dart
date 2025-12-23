import 'package:example/W12/activity_2/START-CODE%20(3)/ui/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import '../utils/animations_util.dart';
import 'classrooms/classrooms.dart';
import 'profile/profile.dart';
import 'students/students.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
    return Scaffold(
      drawer: Drawer(child: AppDrawer()),
      appBar: AppBar(title: const Text('LMS Home'), centerTitle: false),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _HomeButton(
              label: 'Classrooms',
              icon: Icons.class_,
              onTap: () {
                onClassroomPageSelected(context);
              },
            ),
            const SizedBox(height: 16),
            _HomeButton(
              label: 'Students',
              icon: Icons.people,
              onTap: () {
                onStudentPageSelected(context);
              },
            ),
            const SizedBox(height: 16),
            _HomeButton(
              label: "Profile",
              icon: Icons.person,
              onTap: () {
                onProfilePageSelected(context);
                // Navigator.pop(
                //   context,
                //   MaterialPageRoute(builder: (context) => Profile()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _HomeButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton.icon(
          icon: Icon(icon),
          label: Text(label),
          onPressed: onTap,
        ),
      ),
    );
  }
}
