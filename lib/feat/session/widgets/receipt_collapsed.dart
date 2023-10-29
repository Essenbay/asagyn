part of '../session_screen.dart';

class _ReceiptCollapsed extends StatelessWidget {
  final double total;

  const _ReceiptCollapsed({required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  color: AppColors.greyLight.withOpacity(.5)),
            ),
          ),
          const SizedBox(height: 10),
          Row(children: [
            Text(
              'Итого:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              '$total ₸',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ]),
          const SizedBox(height: 10),
          PrimaryFilledTextButton(onPressed: () {}, text: 'Попросить счет'),
        ],
      ),
    );
  }
}
