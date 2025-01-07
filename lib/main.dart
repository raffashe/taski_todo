import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski_todo/views/taski_app.dart';
import 'modals/search_input_model.dart';
import 'viewmodel/task_viewmodel.dart';
import 'viewmodel/search_input_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskViewModel()),
        ChangeNotifierProvider(
            create: (context) => SearchInputViewModel(SearchInputModel())),
      ],
      child: const TaskiApp(),
    ),
  );
}
