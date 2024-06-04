import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/auth/pages/forgot_password/logic/forgot_password_bloc.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/error_message_widget.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

part './forgot_password_enter_email.dart';
part './forgot_password_code.dart';
part './forgot_password_reset.dart';

Future<void> showForgotPassword(BuildContext context) async {
  final resultEmail = await Util.showCustomModalBottomSheet<String?>(
      context: context,
      isDissmissable: false,
      child: BlocProvider(
        create: (context) => ForgotPasswordBloc(getIt()),
        child: const _ForgotPasswordEnterLogin(),
      ));
  if (resultEmail != null) {
    final code = await Util.showCustomModalBottomSheet<String?>(
        context: context,
        isDissmissable: false,
        child: BlocProvider(
          create: (context) => ForgotPasswordBloc(getIt()),
          child: const _ForgotPasswordCode(),
        ));
    if (code != null) {
      await Util.showCustomModalBottomSheet<bool?>(
          context: context,
          isDissmissable: false,
          child: BlocProvider(
            create: (context) => ForgotPasswordBloc(getIt()),
            child: _ResetPassword(
              code: code,
              email: resultEmail,
            ),
          ));
    }
  }
}
