part of './boarding_page_view.dart';

class BoardingInticators extends StatelessWidget {
  const BoardingInticators(
      {super.key, required this.pageNumber, required this.currentPage});
  final int pageNumber;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    final List<Widget> indicators = [];
    for (int i = 0; i < pageNumber; i++) {
      indicators.add(
        Container(
          width: currentPage == i ? 20 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
              color: currentPage == i ? AppColors.primary : AppColors.greyDark,
              borderRadius: currentPage == i
                  ? BorderRadius.circular(10)
                  : BorderRadius.circular(50)),
        ),
      );
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center, children: [...indicators]);
  }
}
