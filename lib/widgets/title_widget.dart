import 'package:flutter/material.dart';

import '../core/app_text_styles.dart';

class TitleWidget extends StatelessWidget {
  final String name;
  final int taskCount;

  const TitleWidget({
    super.key,
    required this.name,
    required this.taskCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Welcome, ',
            style: AppTextStyles.title,
            children: <TextSpan>[
              TextSpan(
                text: name,
                style: AppTextStyles.title.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: '.',
              ),
            ],
          ),
        ),
        Text(
          "You've got $taskCount tasks to do.",
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
