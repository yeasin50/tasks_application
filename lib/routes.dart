import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'pages/projects/_view/projects_page.dart';
import 'pages/tasks/_view/tasks_page.dart';
import 'pages/teams/_view/teams_page.dart';

final ValueKey _tasksPageKey = ValueKey('TasksPage');
final routeConfig = GoRouter(
  initialLocation: '/tasks',
  routes: [
    GoRoute(
      path: '/tasks',
      builder: (context, state) => TasksPage(),
    ),
    GoRoute(
        path: '/tasks/:id',
        builder: (context, state) {
          return TasksPage(selectedTaskID: state.pathParameters['id']);
        }),
    GoRoute(
      path: '/projects',
      builder: (context, state) => ProjectsPage(),
    ),
    GoRoute(
      path: '/teams',
      builder: (context, state) => TeamsPage(),
    ),
  ],
);
