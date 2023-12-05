import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/feat/profilemenu/my_sessions/widget/test_painter.dart';
import 'package:zakazflow/feat/widgets/back_leading_app_bar.dart';

@RoutePage()
class MySessionDetailScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const MySessionDetailScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackIconLeadingAppBar(),
      body: Center(
        child: Container(),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
