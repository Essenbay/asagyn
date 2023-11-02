import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/widgets/custom_text_button.dart';

class Util {
  static void showSnackBar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? context.localized.default_error),
      ),
    );
  }

  static Future<T?> showCustomModalBottomSheet<T>(
      {required BuildContext context,
      required Widget child,
      Color? backgroundColor}) {
    return showModalBottomSheet<T>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FractionallySizedBox(
                widthFactor: 0.15,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 12.0,
                  ),
                  child: Container(
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: AppColors.grey100,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(2.5)),
                    ),
                  ),
                ),
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: backgroundColor ?? AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                child: child,
              ),
            ],
          ),
        );
      },
    );
  }

  static void showErrorAlert(BuildContext context, String? message) {
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

  static Future<bool> showConfirmationDialog(
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

  static void showSuccessDialog(
      BuildContext context, String title, String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
              Text(message),
            ],
          ),
          actions: <Widget>[
            CustomTextButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              text: 'Ok',
            ),
          ],
        );
      },
    );
  }
}