import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/auth/pages/forgot_password/forgot_password_modals.dart';
import 'package:zakazflow/feat/auth/pages/login/logic/login_cubit.dart';
import 'package:zakazflow/feat/auth/widgets/auth_header_animation.dart';
import 'package:zakazflow/feat/auth/widgets/change_language_button.dart.dart';
import 'package:zakazflow/feat/auth/widgets/staggered_animation.dart';
import 'package:zakazflow/feat/widgets/custom_text_button.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';
import 'package:zakazflow/resources/resources.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double space = context.screenSize.height * 0.03;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: AppColors.primary),
          actions: [
            // const TestButton(),
            const ChangeLanguageDropdown(),
          ],
        ),
        body: ListView(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    height: context.screenSize.height * .3,
                    width: context.screenSize.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary,
                          AppColors.primary400,
                          AppColors.primary300,
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      CustomIcons.appIcon,
                      height: context.screenSize.height * .13,
                    ),
                    const SizedBox(height: 20),
                    AuthHeaderAnimation(
                      text: context.localized.login,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: space * 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CustomStaggeredAnimated(
                    position: 0,
                    child: CustomTextField(
                      controller: usernameController,
                      labelText: context.localized.name_label,
                      hintText: context.localized.enter_name,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomStaggeredAnimated(
                    position: 1,
                    child: CustomTextField(
                      controller: passwordController,
                      obscureText: true,
                      labelText: context.localized.password,
                      hintText: context.localized.enter_password,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                          padding: EdgeInsets.zero,
                          color: AppColors.black300,
                          text: context.localized.forgot_password,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          onTap: () => showForgotPassword(context)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      state.mapOrNull(
                        failure: (value) {
                          Util.showErrorAlert(
                              context, value.exception.message(context));
                        },
                        success: (value) {
                          context.router.pushAndPopUntil(const MainRoute(),
                              predicate: ModalRoute.withName('/'));
                        },
                      );
                    },
                    builder: (context, state) {
                      return PrimaryFilledTextButton(
                        onPressed: () {
                          if (usernameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            Util.showSnackBar(context,
                                context.localized.fill_all_necessary_fields);
                          } else {
                            context.read<LoginCubit>().login(
                                login: usernameController.text.trim(),
                                password: passwordController.text.trim());
                          }
                        },
                        isLoading: state.maybeMap(
                            loading: (value) => true, orElse: () => false),
                        text: context.localized.login,
                        addShadow: true,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.localized.or,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      CustomTextButton(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          text: context.localized.register,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          onTap: () =>
                              context.router.replace(const RegisterRoute())),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
