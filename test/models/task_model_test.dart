import 'package:flutter_test/flutter_test.dart';
import 'package:taski_todo/data/models/task_model.dart';

void main() {
  group('Task Model', () {
    test('should create a task with title and description', () {
      final task = Task(
        title: 'Test Task',
        description: 'This is a test description',
        isCompleted: false,
      );

      expect(task.title, 'Test Task');
      expect(task.description, 'This is a test description');
      expect(task.isCompleted, false);
    });

    test('should toggle the completion status', () {
      final task = Task(
        title: 'Test Task',
        description: 'This is a test description',
        isCompleted: false,
      );

      task.isCompleted = !task.isCompleted;

      expect(task.isCompleted, true);
    });
  });
}
