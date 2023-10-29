import 'package:auto_route/auto_route.dart';

Future<void> clearCurrentTabStack(TabsRouter tabsRouter) async {
  if (tabsRouter.current.router.canPop()) {
    await tabsRouter.current.router.popTop().then(
          (value) async => clearCurrentTabStack(tabsRouter),
        );
  }
  return;
}
