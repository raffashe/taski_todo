import 'package:flutter/material.dart';
import 'package:taski_todo/core/app_text_styles.dart';

void showTaskCompletionNotification(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.blue),
          SizedBox(width: 8),
          Text(
            'Task completed!',
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
