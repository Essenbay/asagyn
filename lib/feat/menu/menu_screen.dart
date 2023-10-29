import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/widgets/titled_app_bar.dart';

@RoutePage()
class MenuScreen extends StatelessWidget implements AutoRouteWrapper {
  const MenuScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitledAppBar(titleText: context.localized.home),
    );
  }
}
