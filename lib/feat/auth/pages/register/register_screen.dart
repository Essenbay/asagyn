import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/feat/widgets/back_leading_app_bar.dart';
import 'package:zakazflow/feat/widgets/custom_text_button.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double space = context.screenSize.height * 0.03;

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: BackIconLeadingAppBar(
            icon: CupertinoIcons.xmark,
            actions: [
              CustomTextButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  text: context.localized.login,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  onTap: () => context.router.replace(const LoginRoute())),
            ],
          ),
          body: Container(
            constraints: const BoxConstraints(maxWidth: 600, minWidth: 150),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: space * 2),
                Text(
                  context.localized.register,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: space * 1),
                PrimaryFilledTextButton(
                    onPressed: () {
                      context.router.pushAndPopUntil(const MainRoute(),
                          predicate: ModalRoute.withName('/'));
                    },
                    text: context.localized.register),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}
