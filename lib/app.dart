import 'package:flutter/material.dart';

import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Task list App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routerConfig: routeConfig,
    );
  }
}
