part of 'forgot_password_modals.dart';

class _ForgotPasswordEnterLogin extends StatefulWidget {
  const _ForgotPasswordEnterLogin();
  @override
  State<_ForgotPasswordEnterLogin> createState() =>
      _ForgotPasswordEnterCodeState();
}

class _ForgotPasswordEnterCodeState extends State<_ForgotPasswordEnterLogin> {
  final TextEditingController phoneNumber =
      MaskedTextController(mask: '+7 (000) 000-00-00', text: '7');
  String? errorMessage;
  @override
  void dispose() {
    phoneNumber.dispose();
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
                context.localized.forgot_password,
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
          Text(context.localized.forgot_password_description),
          const SizedBox(height: 30),
          CustomTextField(
            controller: phoneNumber,
            keyboardType: TextInputType.phone,
            hintText: context.localized.enter_phone_number,
            labelText: context.localized.phone_number,
          ),
          const SizedBox(height: 20),
          ErrorMessageWidget(
            text: errorMessage,
            isVisible: errorMessage != null,
            bottomWidget: const SizedBox(height: 20),
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
                      context
                          .read<ForgotPasswordBloc>()
                          .add(ForgotPasswordEvent.getCode(phoneNumber.text));
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
