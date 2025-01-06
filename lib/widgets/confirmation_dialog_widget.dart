import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class ConfirmationDialogWidget extends StatelessWidget {
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmationDialogWidget({
    super.key,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Confirmation',
        style: TextStyle(color: Colors.black),
      ),
      content: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onCancel,
          child: Text(
            'Cancel',
            style: TextStyle(color: AppColors.fireRed),
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(
            'Confirm',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
