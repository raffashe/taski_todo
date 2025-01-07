import 'package:hive/hive.dart';
import '../models/task_model.dart';

class Database {
  static late Box<Task> _taskBox;

  /// Inicializa o Hive e a caixa de tarefas
  static Future<void> initialize() async {
    _taskBox = await Hive.openBox<Task>('taskBox');
  }

  /// Retorna todas as tarefas armazenadas no Hive
  static List<Task> getTasks() {
    return _taskBox.values.toList();
  }

  /// Adiciona uma nova tarefa no Hive
  static Future<void> addTask(Task task) async {
    await _taskBox.add(task);
  }

  /// Atualiza uma tarefa no Hive
  static Future<void> updateTask(int index, Task task) async {
    await _taskBox.putAt(index, task);
  }

  /// Exclui uma tarefa no Hive
  static Future<void> deleteTask(int index) async {
    await _taskBox.deleteAt(index);
  }

  /// Limpa todas as tarefas no Hive
  static Future<void> clearTasks() async {
    await _taskBox.clear();
  }
}
