import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/feat/session/logic/session_bloc.dart';
import 'package:zakazflow/feat/widgets/bottom_navigation/bottom_navigation_router.dart';

@RoutePage(name: 'MainRoute')
class MainBottomNavContainer extends StatelessWidget {
  const MainBottomNavContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SessionBloc>()..add(const SessionEvent.fetch()),
      child: BottomNavigationRouter(
        scaffoldWrapper: (child) => child,
      ),
    );
  }
}
