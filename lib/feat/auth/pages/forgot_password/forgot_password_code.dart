part of 'forgot_password_modals.dart';

class _ForgotPasswordCode extends StatefulWidget {
  const _ForgotPasswordCode();
  @override
  State<_ForgotPasswordCode> createState() => _ForgotPasswordCodeState();
}

class _ForgotPasswordCodeState extends State<_ForgotPasswordCode> {
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
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.localized.enter_code,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
          BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
            listener: (context, state) => state.mapOrNull(
                codeSuccess: (state) => context.router.pop(state.token),
                failure: (state) => setState(() {
                      errorMessage = state.exception.message(context);
                    })),
            builder: (context, state) {
              return PrimaryFilledTextButton(
                onPressed: () {
                  state.maybeMap(
                    orElse: () {
                      context
                          .read<ForgotPasswordBloc>()
                          .add(ForgotPasswordEvent.sendCode(code.text));
                    },
                    loading: (_) {},
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
