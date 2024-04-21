part of '../menu_screen.dart';

class _CartFloatedModal extends StatelessWidget {
  const _CartFloatedModal();

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(builder: (context, value, child) {
      return value.total == 0
          ? const SizedBox()
          : Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1.0,
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 15),
                    Row(children: [
                      Text(
                        '${context.localized.total}:',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      CountUpTotal(total: value.total),
                      // Text(
                      //   '${value.total} ₸',
                      //   style: const TextStyle(
                      //       fontSize: 16, fontWeight: FontWeight.w500),
                      // )
                    ]),
                    const SizedBox(height: 10),
                    PrimaryFilledTextButton(
                      onPressed: () {
                        final provider = context.read<OrderController>();
                        final session =
                            context.read<SessionBloc>().state.mapOrNull(
                                  success: (value) => value.data,
                                );
                        final result = context.router
                            .push(CreateOrderDialogPage(session: session));
                        if (result == true) {
                          provider.clearCart();
                        }
                      },
                      height: 50,
                      text: context.localized.to_order,
                    )
                  ],
                ),
              ),
            );
    });
  }
}
