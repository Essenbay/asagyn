import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/profilemenu/logic/profile_model.dart';
import 'package:zakazflow/feat/profilemenu/pages/profile_detail/logic/change_profile_bloc.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/error_message_widget.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

Future<void> showChangePassword(BuildContext context, ProfileModel init) =>
    Util.showCustomModalBottomSheet(
      context: context,
      child: BlocProvider(
        create: (context) => ChangeProfileBloc(getIt()),
        child: _ResetPassword(data: init),
      ),
    );

class _ResetPassword extends StatefulWidget {
  const _ResetPassword({required this.data});
  final ProfileModel data;

  @override
  State<_ResetPassword> createState() => __ResetPasswordState();
}

class __ResetPasswordState extends State<_ResetPassword> {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  String? errorMessage;

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 16, right: 16, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                context.localized.reset_password,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => context.router.pop(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: password,
            keyboardType: TextInputType.visiblePassword,
            hintText: context.localized.enter_password,
            labelText: context.localized.password,
            obscureText: true,
          ),
          const SizedBox(height: 25),
          CustomTextField(
            controller: confirmPassword,
            keyboardType: TextInputType.visiblePassword,
            hintText: context.localized.enter_password,
            labelText: context.localized.confirm_password,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ErrorMessageWidget(
            text: errorMessage,
            isVisible: errorMessage != null,
            bottomWidget: const SizedBox(height: 10),
          ),
          BlocConsumer<ChangeProfileBloc, ChangeProfileState>(
            listener: (context, state) {
              state.mapOrNull(
                failure: (state) {
                  setState(() {
                    errorMessage = state.exception.message(context);
                  });
                },
                success: (state) {
                  context.router.pop();
                },
              );
            },
            builder: (context, state) {
              return PrimaryFilledTextButton(
                onPressed: () {
                  if (password.text != confirmPassword.text) {
                    setState(() {
                      errorMessage = context.localized.password_dont_match;
                    });
                  } else {
                    context.read<ChangeProfileBloc>().add(
                          ChangeProfileEvent.change(
                            currProfile: widget.data,
                            password: password.text,
                            confirmPassword: confirmPassword.text,
                            email: widget.data.email,
                            username: widget.data.username,
                          ),
                        );
                  }
                },
                text: context.localized.change_password,
                isLoading: state.maybeMap(
                  orElse: () => false,
                  loading: (_) => true,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
