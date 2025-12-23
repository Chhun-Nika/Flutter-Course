
import 'package:example/W12/activity_2/START-CODE%20(3)/ui/classrooms/classroom/tabs/classroom_assingments.dart';
import 'package:flutter/material.dart';

import 'tabs/classroom_feeds.dart';
import 'tabs/classroom_students.dart';

class ClassroomDetails extends StatefulWidget {
  const ClassroomDetails({super.key, required this.classroomId});

  final String classroomId;

  @override
  State<ClassroomDetails> createState() => _ClassroomDetailsState();
}

enum ClassroomTabs { feedTab, studentTab, assignmentTab }

class _ClassroomDetailsState extends State<ClassroomDetails> {
  ClassroomTabs _currentTab = ClassroomTabs.feedTab;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.classroomId), centerTitle: false,),
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          ClassroomFeeds(classroomId: widget.classroomId),
          ClassroomStudents(classroomId: widget.classroomId),
          ClassroomAssingments(classroomId: widget.classroomId)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        currentIndex: _currentTab.index,
        onTap: (index) {
          setState(() {
            _currentTab = ClassroomTabs.values[index];
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dynamic_feed), label: "Feed"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Students"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "Assignment")
        ],
      ),
    );
  }
}
