import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({super.key, required this.model});
  final SessionModel model;
  @override
  Widget build(BuildContext context) {
    return PrimaryFilledTextButton(
      onPressed: () async {
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
                child: _AskBillDialogContent(methods: model.paymentMethods),
              ),
            ),
          ),
        );
        if (result != null) {
          Util.showSuccessDialog(context, context.localized.success,
              context.localized.your_order_created);
        }
      },
      text: context.localized.confirm_order,
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
