import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';

part './boarding_indicator.dart';
part './boarding_page.dart';

class BoardingPageView extends StatefulWidget {
  const BoardingPageView(
      {super.key, required this.images, required this.labels});
  final List<String> images;
  final List<String> labels;
  @override
  State<BoardingPageView> createState() => _BoardingPageViewState();
}

class _BoardingPageViewState extends State<BoardingPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 15,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            allowImplicitScrolling: true,
            itemCount: widget.images.length,
            itemBuilder: (BuildContext context, int index) => BoardingPage(
              image: widget.images[index],
              title: widget.labels[index],
            ),
          ),
        ),
        const SizedBox(height: 10),
        BoardingInticators(
            pageNumber: widget.images.length, currentPage: _currentPage),
      ],
    );
  }
}
