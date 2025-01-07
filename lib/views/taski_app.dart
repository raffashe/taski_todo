import 'package:flutter/material.dart';
import 'package:taski_todo/core/app_routes.dart';
import '../core/app_theme.dart';
import 'home/home_view.dart';

class TaskiApp extends StatelessWidget {
  const TaskiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taski Todo',
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
