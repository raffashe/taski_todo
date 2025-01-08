import 'package:flutter/material.dart';
import 'package:taski_todo/core/constants/app_text_styles.dart';
import '../../views/create/create_task_view.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: TextButton.icon(
        onPressed: () {
          CreateTaskModal.show(context);
        },
        icon: Icon(
          Icons.add,
          size: screenWidth * 0.05,
          color: Colors.blue,
        ),
        label: Text(
          'Create Task',
          style: AppTextStyles.buttonLabel(context).copyWith(
            fontSize: screenWidth * 0.04,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          minimumSize: Size(screenWidth * 0.25, screenWidth * 0.12),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.035,
          ),
        ),
      ),
    );
  }
}
