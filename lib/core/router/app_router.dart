import 'package:auto_route/auto_route.dart';
import 'package:zakazflow/feat/auth/pages/login/login_screen.dart';
import 'package:zakazflow/feat/auth/pages/register/register_screen.dart';
import 'package:zakazflow/feat/auth/pages/start/start_screen.dart';
import 'package:zakazflow/feat/menu/fragments/create_order_dialog.dart';
import 'package:zakazflow/feat/menu/logic/order_controller.dart';
import 'package:zakazflow/feat/session/session_screen.dart';
import 'package:zakazflow/feat/launcher/launcher_screen.dart';
import 'package:zakazflow/feat/main_bottom_nav.dart';
import 'package:zakazflow/feat/menu/menu_screen.dart';
import 'package:zakazflow/feat/profilemenu/settings_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LauncherRoute.page, initial: true),
        AutoRoute(page: StartRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(page: SessionRoute.page),
            AutoRoute(page: SettingsRoute.page),
            AutoRoute(page: MenuRouter.page, children: [
              AutoRoute(page: MenuRoute.page),
              AutoRoute(page: CreateOrderDialogPage.page),
            ]),
          ],
        ),
      ];
}
