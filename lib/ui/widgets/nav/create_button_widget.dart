import 'package:flutter/material.dart';
import 'package:taski_todo/core/constants/app_text_styles.dart';
import '../../views/create/create_task_view.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {
          CreateTaskModal.show(context);
        },
        icon: const Icon(
          Icons.add,
          size: 20.0,
          color: Colors.blue,
        ),
        label: Text(
          'Create Task',
          style: AppTextStyles.buttonLabel,
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          minimumSize: const Size(100.0, 50.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        ),
      ),
    );
  }
}
