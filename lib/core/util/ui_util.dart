import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/widgets/custom_text_button.dart';

abstract class Util {
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
      bool isDissmissable = true,
      bool isScrollControlled = true,
      Color? backgroundColor}) {
    return showModalBottomSheet<T>(
      context: context,
      useSafeArea: false,
      isDismissible: isDissmissable,
      isScrollControlled: isScrollControlled,
      clipBehavior: Clip.hardEdge,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.15,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 9.0,
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
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  child: child,
                ),
              ],
            ),
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
          backgroundColor: AppColors.white,
          title: Text(
            title,
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Text(
            message,
            style: const TextStyle(color: AppColors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                context.localized.cancel,
                style: const TextStyle(color: AppColors.primary),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                context.localized.confirm,
                style: const TextStyle(color: AppColors.red),
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
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Text(message, textAlign: TextAlign.center),
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
