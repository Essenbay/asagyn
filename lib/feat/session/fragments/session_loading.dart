part of '../session_screen.dart';

class _SessionLoading extends StatelessWidget {
  const _SessionLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
