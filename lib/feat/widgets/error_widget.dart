import 'package:flutter/cupertino.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key,
      required this.errorMessage,
      this.isLight = true,
      required this.request});
  final String? errorMessage;
  final bool isLight;
  final VoidCallback request;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.exclamationmark_triangle,
          size: 80,
          color: isLight ? AppColors.white : AppColors.red,
        ),
        const SizedBox(height: 10),
        Text(errorMessage ?? context.localized.default_error,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isLight ? AppColors.white : AppColors.red,
                fontSize: 18)),
        const SizedBox(height: 15),
        PrimaryFilledTextButton(
          onPressed: request,
          text: context.localized.update,
          isLight: isLight,
          borderRadius: 15,
        )
      ],
    );
  }
}
