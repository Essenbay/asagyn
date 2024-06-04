import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/profilemenu/logic/fetch_profile_bloc.dart';
import 'package:zakazflow/feat/profilemenu/pages/profile_detail/widgets/change_password.dart';
import 'package:zakazflow/feat/profilemenu/widgets/menu_tile.dart';
import 'package:zakazflow/feat/widgets/back_leading_app_bar.dart';
import 'package:zakazflow/feat/widgets/error_widget.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

@RoutePage()
class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackIconLeadingAppBar(title: context.localized.profile),
      body: BlocBuilder<FetchProfileBloc, FetchProfileState>(
        builder: (context, state) => state.map(
            loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
            failure: (state) => CustomErrorWidget(
                  errorMessage: state.exception.message(context),
                  request: () => context
                      .read<FetchProfileBloc>()
                      .add(const FetchProfileEvent.fetch()),
                ),
            success: (state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    MenuTile(
                      text: context.localized.name_label,
                      subText: state.data.username,
                      onClick: null,
                      showArrow: false,
                    ),
                    MenuTile(
                      text: context.localized.email_lable,
                      subText: state.data.email,
                      onClick: null,
                      showArrow: false,
                    ),
                    MenuTile(
                      text: context.localized.password,
                      onClick: () {
                        showChangePassword(context, state.data);
                      },
                    ),
                  ],
                )),
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
          ],
        ),
      ),
    );
  }

  static const TextStyle textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
}
