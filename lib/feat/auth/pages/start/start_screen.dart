import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/feat/auth/pages/start/widgets/boarding_page_view.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';
import 'package:zakazflow/resources/resources.dart';

@RoutePage()
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 15,
              child: BoardingPageView(
                images: [
                  Images.boardingExample,
                  Images.boardingExample,
                  Images.boardingExample
                ],
                labels: [
                  context.localized.order,
                  context.localized.checkout_order,
                  context.localized.order,
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PrimaryFilledTextButton(
                onPressed: () => context.router.push(const RegisterRoute()),
                text: context.localized.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
