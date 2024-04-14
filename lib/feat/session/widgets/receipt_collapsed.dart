import 'package:flutter/cupertino.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/session/widgets/ask_bill_button.dart';

class ReceiptCollapsed extends StatelessWidget {
  final SessionModel model;
  final bool showAskBill;
  final double total;
  const ReceiptCollapsed(
      {required this.model, this.showAskBill = true, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 50,
              height: 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.grey400.withOpacity(.5)),
            ),
          ),
          const SizedBox(height: 10),
          Row(children: [
            Text(
              '${context.localized.total}:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              '${total} ₸',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ]),
          const SizedBox(height: 10),
          if (showAskBill) AskBillButton(model: model),
        ],
      ),
    );
  }
}
