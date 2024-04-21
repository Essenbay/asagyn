import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/services/network/network_service.dart';
import 'package:zakazflow/feat/widgets/custom_text_button.dart';
import 'package:zakazflow/feat/widgets/custom_text_field.dart';

class TestButton extends StatelessWidget {
  const TestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          final service = getIt<NetworkService>();
          final result = await showModalBottomSheet(
              context: context, builder: (context) => const _content());
          if (result != null && result is String) {
            service.changeBaseUrl(result);
          }
        },
        icon: const Icon(Icons.text_snippet_rounded));
  }
}

class _content extends StatefulWidget {
  const _content({super.key});

  @override
  State<_content> createState() => _contentState();
}

class _contentState extends State<_content> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
            'Example: https://f8d6-185-18-253-110.ngrok-free.app/demo/api/'),
        CustomTextField(
          controller: _controller,
        ),
        const SizedBox(height: 30),
        CustomTextButton(
          onTap: () {
            context.router.pop(_controller.text);
          },
          text: 'Change',
        )
      ],
    );
  }
}
