import 'package:flutter/material.dart';
import 'package:taski_todo/core/constants/app_routes.dart';
import '../core/constants/app_theme.dart';
import 'views/home/home_view.dart';

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
