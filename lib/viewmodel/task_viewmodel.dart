import 'package:flutter/material.dart';
import '../modals/task_modal.dart';

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;
  List<Task> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  /// Cria uma nova tarefa
  void createTask(String title, String description) {
    if (title.isNotEmpty && description.isNotEmpty) {
      final newTask = Task(
        title: title,
        description: description,
        isCompleted: false,
      );
      _tasks.add(newTask);
      notifyListeners(); // Notifica para atualizar a UI
    }
  }

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

  /// Método de pesquisa
  List<Task> searchTasks(String query) {
    return _tasks.where((task) {
      return task.title.toLowerCase().contains(query.toLowerCase()) ||
          task.description.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
