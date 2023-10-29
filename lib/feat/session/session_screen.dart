import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/example.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/session/logic/session_bloc.dart';
import 'package:zakazflow/feat/widgets/error_widget.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';
import 'package:zakazflow/resources/resources.dart';

part 'fragments/session_loading.dart';
part './fragments/session_failure.dart';
part './fragments/session_empty.dart';
part './fragments/session_body.dart';

@RoutePage()
class SessionScreen extends StatelessWidget implements AutoRouteWrapper {
  const SessionScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SessionBloc>()..add(const SessionEvent.fetch()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SessionBloc, SessionState>(
          builder: (context, state) {
            return state.map(
              loading: (value) => _SessionLoading(),
              failure: (state) =>
                  _SessionFailure(message: state.exception.message(context)),
              success: (state) => state == null
                  ? _SessionEmpty()
                  : _SessionBody(model: state.data!),
            );
          },
        ),
      ),
    );
  }
}
