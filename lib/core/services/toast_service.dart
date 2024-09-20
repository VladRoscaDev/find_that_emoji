import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class ToastService {
  void showErrorNotification(String message, BuildContext context) {
    MotionToast.error(title: const Text('Error'), description: Text(message))
        .show(context);
  }

  void showSuccessNotification(String message, BuildContext context) {
    MotionToast.success(title: const Text('Succes'), description: Text(message))
        .show(context);
  }

  void showWarningNotification(String message, BuildContext context) {
    MotionToast.warning(
            title: const Text('Warning'), description: Text(message))
        .show(context);
  }

  void showInfoNotification(String message, BuildContext context) {
    MotionToast.info(title: const Text('Info'), description: Text(message))
        .show(context);
  }

  void showWarningSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Icon(
          Icons.warning,
          color: Colors.yellow,
        ),
        Flexible(
            child: Text(
          message,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ))
      ],
    )));
  }
}
