import 'package:flutter/material.dart';
import 'package:taski_todo/core/utils/dialog_utils.dart';
import 'package:provider/provider.dart';
import '../../../data/viewmodel/task_viewmodel.dart';

class DeleteAllButton extends StatelessWidget {
  const DeleteAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () {
        _showDeleteAllConfirmationDialog(context);
      },
      child: Text(
        "Delete all",
        style: TextStyle(
          fontSize: screenWidth * 0.045,
          color: Colors.red,
        ),
      ),
    );
  }

  void _showDeleteAllConfirmationDialog(BuildContext context) {
    showDeleteConfirmationDialog(
      context,
      null,
      () {
        context.read<TaskViewModel>().deleteAllCompletedTasks(context);
        Navigator.of(context).pop();
      },
    );
  }
}
