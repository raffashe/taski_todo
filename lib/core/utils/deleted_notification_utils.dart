import 'package:flutter/material.dart';
import 'package:taski_todo/core/constants/app_text_styles.dart';

void showTaskDeletionNotification(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.delete, color: Colors.red),
          SizedBox(width: 8),
          Text(
            'Task deleted successfully!',
            style: AppTextStyles.subtitle,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 2),
    ),
  );
}
