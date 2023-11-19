import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/feat/widgets/custom_text_button.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';
import 'package:zakazflow/resources/resources.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneNumberController =
      MaskedTextController(mask: '+7 (000) 000-00-00', text: '7');
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
              SystemUiOverlayStyle(statusBarColor: AppColors.primary),
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
                    decoration: BoxDecoration(
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
                    Text(
                      context.localized.register,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
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
                  CustomTextField(
                    controller: phoneNumberController,
                    labelText: context.localized.phone_number,
                    hintText: context.localized.enter_phone_number,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: loginController,
                    labelText: context.localized.login_lable,
                    hintText: context.localized.enter_login,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: passwordController,
                    obscureText: true,
                    labelText: context.localized.password,
                    hintText: context.localized.enter_password,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: confirmPassword,
                    obscureText: true,
                    labelText: context.localized.confirm_password,
                    hintText: context.localized.enter_password,
                  ),
                  const SizedBox(height: 30),
                  PrimaryFilledTextButton(
                    onPressed: () {
                      context.router.pushAndPopUntil(const MainRoute(),
                          predicate: ModalRoute.withName('/'));
                    },
                    text: context.localized.register,
                    addShadow: true,
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
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
