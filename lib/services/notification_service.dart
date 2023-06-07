import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class NotificationService {
  static void showErrorNotification(String message, BuildContext context) {
    MotionToast.error(title: const Text('Error'), description: Text(message))
        .show(context);
  }

  static void showSuccessNotification(String message, BuildContext context) {
    MotionToast.success(title: const Text('Succes'), description: Text(message))
        .show(context);
  }

  static void showWarningNotification(String message, BuildContext context) {
    MotionToast.warning(title: const Text('Succes'), description: Text(message))
        .show(context);
  }

  static void showInfoNotification(String message, BuildContext context) {
    MotionToast.info(title: const Text('Succes'), description: Text(message))
        .show(context);
  }
}
