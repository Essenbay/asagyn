import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/widgets/back_leading_app_bar.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

@RoutePage()
class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackIconLeadingAppBar(title: context.localized.profile),
      body: Column(
        children: [
          Text(context.localized.name_label),
          Text(context.localized.surname_label),
          Text(context.localized.login_lable),
          Text(context.localized.phone_number),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryFilledTextButton(
              onPressed: () async {
                final result = Util.showConfirmationDialog(
                    context,
                    context.localized.account_deletion_confirmation_title,
                    context.localized.account_deletion_confirmation_message);
                if (result == true) {}
              },
              text: context.localized.delete_account,
              backgroundColor: AppColors.red,
            ),
            const SizedBox(height: 10),
            PrimaryFilledTextButton(
                onPressed: () {}, text: context.localized.change_profile)
          ],
        ),
      ),
    );
  }
}
