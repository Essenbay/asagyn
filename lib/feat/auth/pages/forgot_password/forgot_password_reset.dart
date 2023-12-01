part of './forgot_password_modals.dart';

class _ResetPassword extends StatefulWidget {
  const _ResetPassword({required this.token});
  final String token;

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
      padding: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.localized.reset_password,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
          const SizedBox(height: 10),
          ErrorMessageWidget(
            text: errorMessage,
            isVisible: errorMessage != null,
            bottomWidget: const SizedBox(height: 10),
          ),
          BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
            listener: (context, state) => state.mapOrNull(
                success: (state) => context.router.pop(true),
                failure: (state) => setState(() {
                      errorMessage = state.exception.message(context);
                    })),
            builder: (context, state) {
              return PrimaryFilledTextButton(
                onPressed: () {
                  state.maybeMap(
                    orElse: () {
                      if (password.text != confirmPassword.text) {
                        setState(() {
                          errorMessage = context.localized.password_dont_match;
                        });
                      } else {
                        context
                            .read<ForgotPasswordBloc>()
                            .add(ForgotPasswordEvent.changePassword(
                              password.text,
                              widget.token,
                            ));
                      }
                    },
                    loading: (_) {},
                  );
                },
                text: context.localized.reset_password,
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
