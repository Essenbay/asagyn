import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/example.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';
import 'package:zakazflow/feat/session/logic/session_bloc.dart';
import 'package:zakazflow/feat/session/widgets/ask_bill_button.dart';
import 'package:zakazflow/feat/session/widgets/notification_popup.dart';
import 'package:zakazflow/feat/session/widgets/order_widget.dart';
import 'package:zakazflow/feat/session/widgets/session_action_popup.dart';
import 'package:zakazflow/feat/widgets/error_widget.dart';
import 'package:zakazflow/feat/widgets/messaged_screen.dart';
import 'package:zakazflow/resources/resources.dart';

part 'fragments/session_loading.dart';
part './fragments/session_failure.dart';
part './fragments/session_body.dart';
part 'widgets/receipt_collapsed.dart';
part 'widgets/receipt_expanded.dart';

@RoutePage()
class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          return state.map(
            loading: (value) => const _SessionLoading(),
            failure: (state) =>
                _SessionFailure(message: state.exception.message(context)),
            success: (state) => state.data == null
                ? MessagedScreen(
                    iconPath: CustomIcons.emptyTable,
                    message: context.localized.empty_sessions,
                    buttonText: context.localized.create_session,
                    buttonOnTap: () {})
                : _SessionBody(model: state.data!),
          );
        },
      ),
    );
  }
}
