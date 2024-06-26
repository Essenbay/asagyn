// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreateOrderDialogPage.name: (routeData) {
      final args = routeData.argsAs<CreateOrderDialogPageArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: CreateOrderDialog(args.session)),
      );
    },
    LauncherRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LauncherScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LoginScreen()),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainBottomNavContainer(),
      );
    },
    MenuRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: MenuRouterPage()),
      );
    },
    MenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MenuScreen(),
      );
    },
    MySessionDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MySessionDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: MySessionDetailScreen(
          key: args.key,
          data: args.data,
        )),
      );
    },
    MySessionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MySessionsScreen()),
      );
    },
    ProfileDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileDetailScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const RegisterScreen()),
      );
    },
    SessionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SessionScreen(),
      );
    },
    SettingsRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsRouterPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    StartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StartScreen(),
      );
    },
  };
}

/// generated route for
/// [CreateOrderDialog]
class CreateOrderDialogPage extends PageRouteInfo<CreateOrderDialogPageArgs> {
  CreateOrderDialogPage({
    required SessionModel? session,
    List<PageRouteInfo>? children,
  }) : super(
          CreateOrderDialogPage.name,
          args: CreateOrderDialogPageArgs(session: session),
          initialChildren: children,
        );

  static const String name = 'CreateOrderDialogPage';

  static const PageInfo<CreateOrderDialogPageArgs> page =
      PageInfo<CreateOrderDialogPageArgs>(name);
}

class CreateOrderDialogPageArgs {
  const CreateOrderDialogPageArgs({required this.session});

  final SessionModel? session;

  @override
  String toString() {
    return 'CreateOrderDialogPageArgs{session: $session}';
  }
}

/// generated route for
/// [LauncherScreen]
class LauncherRoute extends PageRouteInfo<void> {
  const LauncherRoute({List<PageRouteInfo>? children})
      : super(
          LauncherRoute.name,
          initialChildren: children,
        );

  static const String name = 'LauncherRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainBottomNavContainer]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MenuRouterPage]
class MenuRouter extends PageRouteInfo<void> {
  const MenuRouter({List<PageRouteInfo>? children})
      : super(
          MenuRouter.name,
          initialChildren: children,
        );

  static const String name = 'MenuRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MenuScreen]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute({List<PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MySessionDetailScreen]
class MySessionDetailRoute extends PageRouteInfo<MySessionDetailRouteArgs> {
  MySessionDetailRoute({
    Key? key,
    required SessionModel data,
    List<PageRouteInfo>? children,
  }) : super(
          MySessionDetailRoute.name,
          args: MySessionDetailRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'MySessionDetailRoute';

  static const PageInfo<MySessionDetailRouteArgs> page =
      PageInfo<MySessionDetailRouteArgs>(name);
}

class MySessionDetailRouteArgs {
  const MySessionDetailRouteArgs({
    this.key,
    required this.data,
  });

  final Key? key;

  final SessionModel data;

  @override
  String toString() {
    return 'MySessionDetailRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [MySessionsScreen]
class MySessionsRoute extends PageRouteInfo<void> {
  const MySessionsRoute({List<PageRouteInfo>? children})
      : super(
          MySessionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MySessionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileDetailScreen]
class ProfileDetailRoute extends PageRouteInfo<void> {
  const ProfileDetailRoute({List<PageRouteInfo>? children})
      : super(
          ProfileDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SessionScreen]
class SessionRoute extends PageRouteInfo<void> {
  const SessionRoute({List<PageRouteInfo>? children})
      : super(
          SessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsRouterPage]
class SettingsRouter extends PageRouteInfo<void> {
  const SettingsRouter({List<PageRouteInfo>? children})
      : super(
          SettingsRouter.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StartScreen]
class StartRoute extends PageRouteInfo<void> {
  const StartRoute({List<PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
