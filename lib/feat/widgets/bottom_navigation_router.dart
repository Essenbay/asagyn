// ignore_for_file: deprecated_member_use
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/core/router/navigate_core.dart';
import 'package:flutter/material.dart';

typedef WidgetBuilder = Widget Function(Widget widget);

class BottomNavigationRouter extends StatelessWidget {
  const BottomNavigationRouter({super.key, required this.scaffoldWrapper});
  final WidgetBuilder scaffoldWrapper;
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        SessionRoute(),
        MenuRoute(),
        SettingsRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final currentIndex =
            AutoTabsRouter.of(context, watch: true).activeIndex;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.white,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) async => index == currentIndex
                  ? await clearCurrentTabStack(tabsRouter)
                  : tabsRouter.setActiveIndex(index),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: AppColors.white,
              items: [
                //TODO: Change icon to loop more like receipt or session
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.doc_plaintext,
                      color: tabsRouter.activeIndex == 0
                          ? AppColors.primary400
                          : AppColors.greyLight,
                      size: 22,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu_book,
                      color: tabsRouter.activeIndex == 1
                          ? AppColors.primary400
                          : AppColors.greyLight,
                      size: 22,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                      color: tabsRouter.activeIndex == 2
                          ? AppColors.primary400
                          : AppColors.greyLight,
                      size: 22,
                    ),
                    label: ''),
              ]),
        );
      },
    );
  }
}
