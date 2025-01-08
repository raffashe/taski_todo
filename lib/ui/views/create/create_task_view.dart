import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski_todo/ui/widgets/modal/create_task_widget.dart';
import '../../../data/viewmodel/task_viewmodel.dart';

class CreateTaskModal {
  static void show(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.06),
          topRight: Radius.circular(MediaQuery.of(context).size.width * 0.06),
        ),
      ),
      barrierColor: Colors.transparent,
      elevation: 0,
      builder: (context) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;

        return Container(
          width: double.infinity,
          height: screenHeight / 2,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth * 0.06),
                topRight: Radius.circular(screenWidth * 0.06),
              ),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x7FC5CEDB),
                blurRadius: 24,
                offset: Offset(0, -6),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: CreateTaskWidget(
              titleController: titleController,
              descriptionController: descriptionController,
              onSave: () {
                final title = titleController.text;
                final description = descriptionController.text;

                if (title.isNotEmpty && description.isNotEmpty) {
                  context.read<TaskViewModel>().createTask(title, description);
                  Navigator.pop(context);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
