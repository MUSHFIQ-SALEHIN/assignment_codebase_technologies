import 'package:codebase_assignment/core/utils/enums.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(
  BuildContext context, {
  required String message,
  required MessageType type,
}) {
  final backgroundColor = switch (type) {
    MessageType.error => Colors.red,
    MessageType.success => Colors.green,
    MessageType.warning => Colors.orange,
    MessageType.info => Colors.blue,
  };

  final icon = switch (type) {
    MessageType.error => Icons.error,
    MessageType.success => Icons.check_circle,
    MessageType.warning => Icons.warning,
    MessageType.info => Icons.info,
  };

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(message, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    ),
  );
}

void showCustomDialog(
  BuildContext context, {
  required String title,
  required String message,
  required MessageType type,
}) {
  final icon = switch (type) {
    MessageType.error => Icons.error,
    MessageType.success => Icons.check_circle,
    MessageType.warning => Icons.warning,
    MessageType.info => Icons.info,
  };

  final iconColor = switch (type) {
    MessageType.error => Colors.red,
    MessageType.success => Colors.green,
    MessageType.warning => Colors.orange,
    MessageType.info => Colors.blue,
  };

  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 10),
              Text(title),
            ],
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
  );
}

void closeSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
}
