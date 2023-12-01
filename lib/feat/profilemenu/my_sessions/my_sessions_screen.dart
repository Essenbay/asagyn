import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/widgets/back_leading_app_bar.dart';

@RoutePage()
class MySessionsScreen extends StatelessWidget {
  const MySessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackIconLeadingAppBar(
        title: context.localized.my_sessions,
      ),
      body: const Column(),
    );
  }
}
