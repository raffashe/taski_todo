import 'package:flutter/material.dart';
import 'package:taski_todo/ui/widgets/dialog/confirmation_dialog_widget.dart';
import '../../data/models/task_model.dart';

Future<void> showDeleteConfirmationDialog(
  BuildContext context,
  Task? task,
  VoidCallback onConfirm,
) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ConfirmationDialogWidget(
        message: task == null
            ? 'Are you sure you want to delete all completed tasks?'
            : 'Are you sure you want to delete this task?',
        onConfirm: onConfirm,
        onCancel: () {
          Navigator.pop(context);
        },
      );
    },
  );
}
