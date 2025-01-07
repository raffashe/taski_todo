import 'package:flutter/material.dart';
import 'package:taski_todo/core/constants/app_colors.dart';
import 'package:taski_todo/core/constants/app_text_styles.dart';

class CreateTaskWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final VoidCallback onSave;

  const CreateTaskWidget({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double availableHeight = screenHeight / 2 - 80;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(42),
        width: double.infinity,
        height: availableHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              style: AppTextStyles.subtitle,
              decoration: InputDecoration(
                hintText: 'What’s in your mind?',
                hintStyle: AppTextStyles.subtitle,
                prefixIcon: const Icon(
                  Icons.check_box_outline_blank,
                  color: AppColors.mutedAzure,
                ),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 16),
            Stack(
              children: [
                TextField(
                  controller: descriptionController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: AppTextStyles.body,
                  decoration: InputDecoration(
                    hintText: 'Add a note...',
                    hintStyle: AppTextStyles.body,
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(left: 40.0, top: 16.0),
                  ),
                  onChanged: (text) {
                    if (text.length > 100) {
                      descriptionController.text = text.substring(0, 300);
                    }
                  },
                ),
                Positioned(
                  top: 16.0,
                  left: 10.0,
                  child: const Icon(
                    Icons.edit_rounded,
                    color: AppColors.mutedAzure,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: onSave,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Create',
                  style: AppTextStyles.subtitle.copyWith(
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
