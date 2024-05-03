import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/feat/menu/logic/menu_bloc.dart';
import 'package:zakazflow/feat/profilemenu/logic/fetch_profile_bloc.dart';
import 'package:zakazflow/feat/session/logic/pusher_provider.dart';
import 'package:zakazflow/feat/session/logic/session_bloc.dart';
import 'package:zakazflow/feat/widgets/bottom_navigation/bottom_navigation_router.dart';

@RoutePage(name: 'MainRoute')
class MainBottomNavContainer extends StatelessWidget {
  const MainBottomNavContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SessionBloc(getIt(), getIt())..add(const SessionEvent.fetch()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MenuBloc(getIt()),
          ),
          BlocProvider(
              create: (context) => FetchProfileBloc(getIt())
                ..add(const FetchProfileEvent.fetch())),
        ],
        child: ChangeNotifierProvider(
          create: (context) => PusherProvider(getIt())..init(),
          child: BottomNavigationRouter(
            scaffoldWrapper: (child) => child,
          ),
        ),
      ),
    );
  }
}
