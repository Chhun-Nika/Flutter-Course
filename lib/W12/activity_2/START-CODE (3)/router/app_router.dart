import 'package:go_router/go_router.dart';

import '../ui/classrooms/classrooms.dart';
import '../ui/home.dart';
import '../ui/students/students.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),

    GoRoute(
      path: '/classrooms',
      builder: (context, state) => const Classrooms(),
    ),
    GoRoute(
      path: '/students',
      builder: (context, state) => const Students(),
    ),
  ],
);