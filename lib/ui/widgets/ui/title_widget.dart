import 'package:flutter/material.dart';
import '../../../core/constants/app_text_styles.dart';

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
        FittedBox(
          fit: BoxFit.scaleDown,
          child: RichText(
            text: TextSpan(
              text: 'Welcome, ',
              style: AppTextStyles.title(context),
              children: <TextSpan>[
                TextSpan(
                  text: name,
                  style: AppTextStyles.title(context).copyWith(
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
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "You've got $taskCount tasks to do.",
            style: AppTextStyles.subtitle(context).copyWith(
              fontSize: MediaQuery.of(context).size.width * 0.045,
            ),
          ),
        ),
      ],
    );
  }
}
