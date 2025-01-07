import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taski_todo/ui/taski_app.dart';
import 'data/models/task_model.dart';
import 'data/viewmodel/search_Input_viewmodel.dart';
import 'data/viewmodel/task_viewmodel.dart';
import 'data/models/search_input_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Inicializa Hive
  await Hive.initFlutter();

  /// Registra o adaptador de Task
  Hive.registerAdapter(TaskAdapter());

  /// Abre a caixa de tarefas
  await Hive.openBox<Task>('taskBox');

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
