import 'package:flutter/material.dart';
import 'package:taski_todo/ui/widgets/ui/card_task_widget.dart';
import 'package:provider/provider.dart';
import '../../../data/viewmodel/task_viewmodel.dart';
import 'package:taski_todo/core/utils/dialog_utils.dart';

class DoneTaskList extends StatelessWidget {
  const DoneTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final completedTasks = context.watch<TaskViewModel>().completedTasks;
    double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: completedTasks.isEmpty
          ? Center(
              child: Text(
                "Nenhuma tarefa concluída",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                ),
              ),
            )
          : ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                final task = completedTasks[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: screenWidth * 0.04,
                  ),
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
                          context
                              .read<TaskViewModel>()
                              .deleteTask(task, context);
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
