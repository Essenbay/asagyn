import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/profilemenu/logic/profile_model.dart';
import 'package:zakazflow/feat/profilemenu/pages/profile_detail/logic/change_profile_bloc.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/error_message_widget.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

Future<String?> changeEmailModal(BuildContext context, ProfileModel init) =>
    Util.showCustomModalBottomSheet(
      context: context,
      child: BlocProvider(
        create: (context) => ChangeProfileBloc(getIt()),
        child: _ChangeEmail(init),
      ),
    );

class _ChangeEmail extends StatefulWidget {
  const _ChangeEmail(this.init);
  final ProfileModel init;
  @override
  State<_ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<_ChangeEmail> {
  late final email = TextEditingController(text: widget.init.email);
  String? error;

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: BlocListener<ChangeProfileBloc, ChangeProfileState>(
        listener: (context, state) {
          state.mapOrNull(
            loading: (state) => context.loaderOverlay.show(),
            failure: (state) {
              context.loaderOverlay.hide();
              setState(() {
                error = state.exception.message(context);
              });
            },
            success: (state) {
              context.loaderOverlay.hide();
              context.router.pop(email.text);
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${context.localized.change_email}:',
              style: context.theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: email,
              labelText: context.localized.email_lable,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ErrorMessageWidget(
              text: error,
              isVisible: error != null,
              bottomWidget: const SizedBox(height: 20),
            ),
            PrimaryFilledTextButton(
              onPressed: () {
                if (email.text.isEmpty) {
                  setState(() {
                    error = context.localized.fill_all_necessary_fields;
                  });
                } else {
                  context.read<ChangeProfileBloc>().add(
                        ChangeProfileEvent.change(
                            currProfile: widget.init, email: email.text),
                      );
                }
              },
              text: context.localized.save,
            ),
          ],
        ),
      ),
    );
  }
}
