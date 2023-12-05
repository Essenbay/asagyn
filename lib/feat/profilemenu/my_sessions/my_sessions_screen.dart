import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/profilemenu/my_sessions/logic/my_sessions_bloc.dart';
import 'package:zakazflow/feat/profilemenu/my_sessions/widget/session_widget.dart';
import 'package:zakazflow/feat/widgets/back_leading_app_bar.dart';
import 'package:zakazflow/feat/widgets/error_widget.dart';

@RoutePage()
class MySessionsScreen extends StatelessWidget implements AutoRouteWrapper {
  const MySessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackIconLeadingAppBar(
        title: context.localized.my_sessions,
      ),
      body: BlocBuilder<MySessionsBloc, MySessionsState>(
        builder: (context, state) => state.map(
          loading: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          failure: (state) => CustomErrorWidget(
            errorMessage: state.exception.message(context),
            request: () => context
                .read<MySessionsBloc>()
                .add(const MySessionsEvent.fetch()),
          ),
          success: (state) => ListView.separated(
            itemBuilder: (context, index) => SessionWidget(
              data: state.data[index],
            ),
            itemCount: state.data.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 3, color: AppColors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MySessionsBloc(getIt())..add(const MySessionsEvent.fetch()),
      child: this,
    );
  }
}
