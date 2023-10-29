import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';

class Util {
  static void showSnackBar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? context.localized.default_error),
      ),
    );
  }

  void showErrorAlert(BuildContext context, String? message) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.localized.default_error,
              style: const TextStyle(color: Colors.red)),
          content: Text(
            message ?? context.localized.default_error,
            style: const TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the alert dialog
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<bool> showConfirmationDialog(
      BuildContext context, String title, String message) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.greyBackground,
          title: Text(
            title,
            style: const TextStyle(color: AppColors.white),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Text(
            message,
            style: const TextStyle(color: AppColors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                context.localized.cancel,
                style: const TextStyle(color: AppColors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                context.localized.confirm,
                style: const TextStyle(color: AppColors.white),
              ),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }
}
