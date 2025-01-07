import 'package:flutter/material.dart';
import 'package:taski_todo/widgets/card_task_widget.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/task_viewmodel.dart';
import 'package:taski_todo/utils/dialog_utils.dart';

class DoneTaskList extends StatelessWidget {
  const DoneTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final completedTasks = context.watch<TaskViewModel>().completedTasks;

    return Expanded(
      child: completedTasks.isEmpty
          ? Center(child: Text("Nenhuma tarefa concluída"))
          : ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                final task = completedTasks[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CardTask(
                    title: task.title,
                    description: task.description,
                    isCompleted: task.isCompleted,
                    onToggleCompletion: () {
                      context.read<TaskViewModel>().toggleCompletion(task);
                    },
                    onDelete: () {
                      showDeleteConfirmationDialog(
                        context,
                        task,
                        () {
                          context.read<TaskViewModel>().deleteTask(task);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    showMoreIcon: false,
                  ),
                );
              },
            ),
    );
  }
}
