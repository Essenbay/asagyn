import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/menu/logic/menu_bloc.dart';
import 'package:zakazflow/feat/session/fragments/no_session_screen.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/session/logic/session_bloc.dart';
import 'package:zakazflow/feat/session/widgets/order_widget.dart';
import 'package:zakazflow/feat/session/widgets/receipt_collapsed.dart';
import 'package:zakazflow/feat/session/widgets/receipt_expanded.dart';
import 'package:zakazflow/feat/session/widgets/session_action_popup.dart';
import 'package:zakazflow/feat/widgets/error_widget.dart';
import 'package:zakazflow/feat/widgets/messaged_screen.dart';
import 'package:zakazflow/resources/resources.dart';

part 'fragments/session_loading.dart';
part './fragments/session_failure.dart';
part './fragments/session_body.dart';

@RoutePage()
class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: BlocConsumer<SessionBloc, SessionState>(
          listener: (context, state) {
            state.mapOrNull(
              success: (value) {
                if (value.data?.establishmentDTO != null) {
                  context
                      .read<MenuBloc>()
                      .add(MenuEvent.fetch(value.data!.establishmentDTO.id));
                }
              },
            );
          },
          builder: (context, state) {
            return state.map(
              loading: (value) => const _SessionLoading(),
              failure: (state) =>
                  _SessionFailure(message: state.exception.message(context)),
              success: (state) => state.data == null
                  ? const NoSessionPage()
                  : _SessionBody(model: state.data!, orders: state.orders),
            );
          },
        ),
      ),
    );
  }
}
