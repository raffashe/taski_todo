import 'package:flutter/material.dart';
import '../core/app_routes.dart';
import 'home/home_view.dart';

class TaskiApp extends StatelessWidget {
  const TaskiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taski Todo',
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
      ),
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
