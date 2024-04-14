import 'package:auto_route/auto_route.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/core/router/navigate_core.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/feat/widgets/bottom_navigation/bottom_nav_button.dart';
import 'package:flutter_animated_icons/icons8.dart';

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
          bottomNavigationBar: Material(
            elevation: .4,
            color: AppColors.white,
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) async => index == currentIndex
                    ? await clearCurrentTabStack(tabsRouter)
                    : tabsRouter.setActiveIndex(index),
                selectedFontSize: 12,
                unselectedFontSize: 12,
                elevation: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.transparent,
                items: [
                  BottomNavigationBarItem(
                      icon: BottomNavAnimated(
                        value: 0,
                        groupValue: tabsRouter.activeIndex,
                        icon: Icons8.receipt,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: BottomNavAnimated(
                        value: 1,
                        groupValue: tabsRouter.activeIndex,
                        icon: Icons8.book,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: BottomNavAnimated(
                          value: 2,
                          groupValue: tabsRouter.activeIndex,
                          icon: Icons8.icons8_menu_48_),
                      label: ''),
                ]),
          ),
        );
      },
    );
  }
}
