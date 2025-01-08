import 'package:flutter/material.dart';
import 'package:taski_todo/core/constants/app_colors.dart';
import 'package:taski_todo/core/constants/app_text_styles.dart';
import 'package:taski_todo/core/utils/completed_notification_utils.dart';

class CardTask extends StatefulWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final VoidCallback onToggleCompletion;
  final VoidCallback onDelete;
  final bool showMoreIcon;

  const CardTask({
    super.key,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.onToggleCompletion,
    required this.onDelete,
    this.showMoreIcon = true,
  });

  @override
  _CardTaskState createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {
  bool isExpanded = false;

  void toggleExpansion() => setState(() => isExpanded = !isExpanded);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: toggleExpansion,
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.07,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColors.paleWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      widget.isCompleted
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: widget.isCompleted
                          ? AppColors.mutedAzure
                          : const Color(0xFFC5CEDB),
                    ),
                    onPressed: () {
                      widget.onToggleCompletion();
                      if (!widget.isCompleted) {
                        showTaskCompletionNotification(context);
                      }
                    },
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: AppTextStyles.subtitlecard(context),
                    ),
                  ),
                  if (widget.isCompleted)
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: widget.onDelete,
                    )
                  else if (!isExpanded && widget.showMoreIcon)
                    IconButton(
                      icon: const Icon(Icons.more_horiz),
                      onPressed: toggleExpansion,
                    ),
                ],
              ),
              if (isExpanded) ...[
                const SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                  ),
                  child: Text(
                    widget.description,
                    style: AppTextStyles.body(context),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
