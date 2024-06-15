import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/session/logic/pusher_provider.dart';
import 'package:zakazflow/feat/session/logic/session_repository.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

class AskBillButton extends StatelessWidget {
  const AskBillButton({super.key, required this.model});
  final SessionModel model;
  @override
  Widget build(BuildContext context) {
    return PrimaryFilledTextButton(
      onPressed: () async {
        bool allow = context
            .read<PusherProvider>()
            .orders
            .where((element) =>
                element.orderStatus != OrderStatus.cancelled &&
                element.orderStatus != OrderStatus.served)
            .isEmpty;
        if (!allow) {
          Util.showSnackBar(context, context.localized.wait_untill_order_close);
          return;
        }
        final result = await showDialog<PaymentMethod>(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: AppColors.white,
            content: IntrinsicHeight(
              child: Align(
                alignment: Alignment.center,
                child: _AskBillDialogContent(
                  methods: model.establishmentDTO.paymentMethods ?? [],
                ),
              ),
            ),
          ),
        );
        if (result != null) {
          context.loaderOverlay.show();
          final requestResult = await getIt<SessionRepository>()
              .askSessionClosing(model.id, result);
          requestResult.whenOrNull(
            success: (data) {
              context.loaderOverlay.hide();
              Util.showSuccessDialog(context, context.localized.success,
                  context.localized.waiters_will_be_soon);
            },
            failure: (exception) {
              context.loaderOverlay.hide();
              Util.showErrorAlert(context, exception.message(context));
            },
          );
        }
      },
      text: context.localized.ask_bill,
    );
  }
}

class _AskBillDialogContent extends StatefulWidget {
  const _AskBillDialogContent({required this.methods});
  final List<PaymentMethod> methods;

  @override
  State<_AskBillDialogContent> createState() => _AskBillDialogContentState();
}

class _AskBillDialogContentState extends State<_AskBillDialogContent> {
  PaymentMethod? selectedPayment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(context.localized.payment_by,
            textAlign: TextAlign.start,
            style: context.theme.textTheme.titleLarge),
        const SizedBox(height: 10),
        Wrap(
          children: widget.methods
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ChoiceChip.elevated(
                    label: Text(e.name),
                    selected: selectedPayment == e,
                    side: const BorderSide(color: AppColors.primary),
                    backgroundColor: AppColors.white,
                    selectedColor: AppColors.primary,
                    labelStyle: TextStyle(
                      color: selectedPayment == e
                          ? AppColors.white
                          : AppColors.primary,
                    ),
                    onSelected: (value) => setState(() {
                      selectedPayment = e;
                    }),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 10),
        PrimaryFilledTextButton(
            border: Border.all(color: AppColors.primary),
            isLight: selectedPayment == null,
            onPressed: () {
              if (selectedPayment == null)
                context.router.pop();
              else
                context.router.pop(selectedPayment);
            },
            text: context.localized.pay),
      ],
    );
  }
}
