import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/feat/widgets/bottom_navigation_router.dart';

@RoutePage(name: 'MainRoute')
class MainBottomNavContainer extends StatelessWidget {
  const MainBottomNavContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationRouter(
      scaffoldWrapper: (child) => child,
    );
  }
}
