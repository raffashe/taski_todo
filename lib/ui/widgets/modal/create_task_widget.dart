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
    double screenWidth = MediaQuery.of(context).size.width;
    double availableHeight = screenHeight / 2 - 80;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(screenWidth * 0.1),
        width: double.infinity,
        height: availableHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth * 0.06),
            topRight: Radius.circular(screenWidth * 0.06),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            TextField(
              controller: titleController,
              style: AppTextStyles.inputTitle(context).copyWith(
                fontSize: screenWidth * 0.045,
              ),
              decoration: InputDecoration(
                hintText: 'What’s in your mind?',
                hintStyle: AppTextStyles.inputTitle(context).copyWith(
                  fontSize: screenWidth * 0.045,
                ),
                prefixIcon: Icon(
                  Icons.check_box_outline_blank,
                  color: AppColors.mutedAzure,
                  size: screenWidth * 0.06,
                ),
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Stack(
              children: [
                TextField(
                  controller: descriptionController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: AppTextStyles.body(context).copyWith(
                    fontSize: screenWidth * 0.04,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Add a note...',
                    hintStyle: AppTextStyles.body(context).copyWith(
                      fontSize: screenWidth * 0.04,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: screenWidth * 0.1,
                      top: screenHeight * 0.02,
                    ),
                  ),
                  onChanged: (text) {
                    if (text.length > 300) {
                      descriptionController.text = text.substring(0, 300);
                    }
                  },
                ),
                Positioned(
                  top: screenHeight * 0.02,
                  left: screenWidth * 0.02,
                  child: Icon(
                    Icons.edit_rounded,
                    color: AppColors.mutedAzure,
                    size: screenWidth * 0.06,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            GestureDetector(
              onTap: onSave,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Create',
                  style: AppTextStyles.buttonLabel(context).copyWith(
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.045,
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
