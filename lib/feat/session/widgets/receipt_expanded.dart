part of '../session_screen.dart';

class _ReceiptExpanded extends StatelessWidget {
  const _ReceiptExpanded({required this.model});
  final SessionModel model;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5),
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                '${model.total} ₸',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ]),
            const Divider(),
            ...model.allItems.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(children: [
                    Text(
                      'x${e.quantity}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      e.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      '${e.cost} ₸',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ]),
                )),
            const SizedBox(height: 10),
            AskBillButton(model: model),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
