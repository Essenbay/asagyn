import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/auth/pages/register/logic/register_cubit.dart';
import 'package:zakazflow/feat/auth/widgets/auth_header_animation.dart';
import 'package:zakazflow/feat/auth/widgets/change_language_button.dart.dart';
import 'package:zakazflow/feat/auth/widgets/staggered_animation.dart';
import 'package:zakazflow/feat/widgets/custom_text_button.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/error_message_widget.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';
import 'package:zakazflow/resources/resources.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt()),
      child: this,
    );
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  //TODO: Add fullname
  final phoneNumberController =
      MaskedTextController(mask: '+7 (000) 000-00-00', text: '7');
  final nameController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();

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
                      text: context.localized.register,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: space * 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AnimationLimiter(
                child: Column(
                  children: [
                    CustomStaggeredAnimated(
                      position: 0,
                      child: CustomTextField(
                        controller: nameController,
                        labelText: context.localized.name_label,
                        hintText: context.localized.enter_name,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomStaggeredAnimated(
                      position: 1,
                      child: CustomTextField(
                        controller: loginController,
                        labelText: context.localized.email_lable,
                        hintText: context.localized.enter_email,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomStaggeredAnimated(
                      position: 2,
                      child: CustomTextField(
                        controller: passwordController,
                        obscureText: true,
                        labelText: context.localized.password,
                        hintText: context.localized.enter_password,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomStaggeredAnimated(
                      position: 3,
                      child: CustomTextField(
                        controller: confirmPassword,
                        obscureText: true,
                        labelText: context.localized.confirm_password,
                        hintText: context.localized.enter_password,
                      ),
                    ),
                    const SizedBox(height: 30),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        state.mapOrNull(
                          failure: (value) {
                            Util.showErrorAlert(
                                context, value.exception.message(context));
                          },
                          codeSent: (value) {
                            Util.showCustomModalBottomSheet<void>(
                              context: context,
                              child: BlocProvider.value(
                                value: context.read<RegisterCubit>(),
                                child: _ConfirmCode(
                                    loginController.text,
                                    nameController.text,
                                    passwordController.text,
                                    confirmPassword.text),
                              ),
                            );
                          },
                          success: (value) {
                            context.router.pop();
                            context.router.pushAndPopUntil(
                              const LoginRoute(),
                              predicate: ModalRoute.withName('/'),
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        return PrimaryFilledTextButton(
                          onPressed: () {
                            if (loginController.text.isEmpty ||
                                passwordController.text.isEmpty ||
                                confirmPassword.text.isEmpty ||
                                nameController.text.isEmpty) {
                              Util.showSnackBar(context,
                                  context.localized.fill_all_necessary_fields);
                            } else if (passwordController.text !=
                                confirmPassword.text) {
                              Util.showSnackBar(context,
                                  context.localized.password_dont_match);
                            } else {
                              context
                                  .read<RegisterCubit>()
                                  .sendCode(loginController.text);
                            }
                          },
                          isLoading: state.maybeMap(
                              loading: (value) => true, orElse: () => false),
                          text: context.localized.register,
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
                            text: context.localized.login,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            onTap: () =>
                                context.router.replace(const LoginRoute())),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _ConfirmCode extends StatefulWidget {
  const _ConfirmCode(
    this.email,
    this.name,
    this.password,
    this.confirmPassword,
  );
  final String email;
  final String name;
  final String password;
  final String confirmPassword;

  @override
  State<_ConfirmCode> createState() => __ConfirmCodeState();
}

class __ConfirmCodeState extends State<_ConfirmCode> {
  final TextEditingController code = TextEditingController();
  String? errorMessage;

  @override
  void dispose() {
    code.dispose();
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
                context.localized.enter_code,
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
          const SizedBox(height: 5),
          Text(context.localized.enter_code_description),
          const SizedBox(height: 20),
          Align(
            child: Pinput(
              controller: code,
              defaultPinTheme: const PinTheme(
                  textStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.primary300),
                    ),
                  )),
            ),
          ),
          const SizedBox(height: 20),
          ErrorMessageWidget(
            text: errorMessage,
            isVisible: errorMessage != null,
            bottomWidget: const SizedBox(height: 20),
          ),
          BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) => state.mapOrNull(
                failure: (state) => setState(() {
                      errorMessage = state.exception.message(context);
                    })),
            builder: (context, state) {
              return PrimaryFilledTextButton(
                onPressed: () {
                  if (code.text.isEmpty) {
                    setState(() {
                      errorMessage =
                          context.localized.fill_all_necessary_fields;
                    });
                    return;
                  }
                  context.read<RegisterCubit>().register(
                        email: widget.email,
                        fullname: widget.name,
                        password: widget.password,
                        confirmPassword: widget.confirmPassword,
                        code: code.text,
                      );
                },
                text: context.localized.next,
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
