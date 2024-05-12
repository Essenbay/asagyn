import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/feat/session/logic/session_bloc.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';
import 'package:zakazflow/resources/resources.dart';

class NoSessionPage extends StatefulWidget {
  const NoSessionPage();

  @override
  State<NoSessionPage> createState() => _NoSessionState();
}

class _NoSessionState extends State<NoSessionPage> {
  final estabCode = TextEditingController();
  final table = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final space = context.screenSize.height * 0.04;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                CustomIcons.emptyTable,
                height: 80,
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              SizedBox(height: space * 1),
              Text(
                context.localized.empty_sessions,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: space),
              CustomTextField(
                controller: estabCode,
                labelText: context.localized.estab_code,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: space),
              CustomTextField(
                controller: table,
                labelText: context.localized.table,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: space),
              PrimaryFilledTextButton(
                onPressed: () {
                  if (estabCode.text.isEmpty) {
                    Util.showSnackBar(
                        context, context.localized.enter_estab_code);
                  } else {
                    context.read<SessionBloc>().add(SessionEvent.create(
                          estabCode.text,
                          table.text,
                        ));
                  }
                },
                text: context.localized.create_session,
                borderRadius: 15,
              )
            ]),
      ),
    );
  }
}
