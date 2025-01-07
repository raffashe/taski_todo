import 'package:flutter/material.dart';
import '../database/database.dart';
import '../models/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;
  List<Task> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  TaskViewModel() {
    _initializeTasks();
  }

  /// Inicializa as tarefas a partir do banco de dados
  Future<void> _initializeTasks() async {
    _tasks = Database.getTasks();

    /// Obter tarefas do banco de dados
    notifyListeners();
  }

  /// Cria uma nova tarefa
  void createTask(String title, String description) {
    if (title.isNotEmpty && description.isNotEmpty) {
      final newTask = Task(
        title: title,
        description: description,
        isCompleted: false,
      );
      Database.addTask(newTask);

      /// Adiciona a tarefa no banco
      _tasks.add(newTask);
      notifyListeners();
    }
  }

  /// Alterna o estado de conclusão de uma tarefa
  void toggleCompletion(Task task) {
    final taskIndex = _tasks.indexOf(task);
    if (taskIndex != -1) {
      _tasks[taskIndex].isCompleted = !_tasks[taskIndex].isCompleted;
      Database.updateTask(taskIndex, _tasks[taskIndex]);

      /// Atualiza no banco
      notifyListeners();
    }
  }

  /// Exclui uma tarefa
  void deleteTask(Task task) {
    final taskIndex = _tasks.indexOf(task);
    Database.deleteTask(taskIndex);

    /// Remove do banco de dados
    _tasks.remove(task);
    notifyListeners();
  }

  /// Excluir todas as tarefas concluídas
  void deleteAllCompletedTasks() {
    _tasks.removeWhere((task) => task.isCompleted);
    Database.clearTasks();

    /// Limpa todas as tarefas no banco
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
