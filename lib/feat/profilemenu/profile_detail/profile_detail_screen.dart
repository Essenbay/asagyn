import 'package:auto_route/auto_route.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/widgets/back_leading_app_bar.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

@RoutePage()
class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();

  static const TextStyle textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final phoneNumberController =
      MaskedTextController(mask: '+7 (000) 000-00-00', text: '7');
  final loginController = TextEditingController();
  final fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackIconLeadingAppBar(title: context.localized.profile),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(context.localized.surname_label,
                style: ProfileDetailScreen.textStyle),
            const SizedBox(height: 5),
            CustomTextField(
              controller: fullnameController,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 10),
            Text(context.localized.login_lable,
                style: ProfileDetailScreen.textStyle),
            const SizedBox(height: 5),
            CustomTextField(
              controller: loginController,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 10),
            Text(context.localized.phone_number,
                style: ProfileDetailScreen.textStyle),
            const SizedBox(height: 5),
            CustomTextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.name,
            ),
          ],
        ),
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
                onPressed: () {}, text: context.localized.save)
          ],
        ),
      ),
    );
  }
}
