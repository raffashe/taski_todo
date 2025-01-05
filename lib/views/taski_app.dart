import 'package:flutter/material.dart';

import 'home/home_view.dart';

class TaskiApp extends StatelessWidget {
  const TaskiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Taski Todo',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
