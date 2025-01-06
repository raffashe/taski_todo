import 'package:flutter/material.dart';
import '../models/create_task_model.dart';

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Task 1', description: 'Description 1', isCompleted: false),
    Task(title: 'Task 2', description: 'Description 2', isCompleted: false),
    Task(title: 'Task 3', description: 'Description 3', isCompleted: false),
    Task(title: 'Task 4', description: 'Description 4', isCompleted: false),
    Task(title: 'Task 5', description: 'Description 5', isCompleted: false),
    Task(title: 'Task 6', description: 'Description 6', isCompleted: false),
  ];

  List<Task> get tasks => _tasks;
  List<Task> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  /// Alterna o estado de conclusão de uma tarefa
  void toggleCompletion(Task task) {
    final taskIndex = _tasks.indexOf(task);
    if (taskIndex != -1) {
      _tasks[taskIndex].isCompleted = !_tasks[taskIndex].isCompleted;
      notifyListeners();
    }
  }

  /// Exclui uma tarefa
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  /// Excluir todas as tarefas concluídas
  void deleteAllCompletedTasks() {
    _tasks.removeWhere((task) => task.isCompleted);
    notifyListeners();
  }

  /// Método de pesquisa (não alterado)
  List<Task> searchTasks(String query) {
    return _tasks.where((task) {
      return task.title.toLowerCase().contains(query.toLowerCase()) ||
          task.description.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
