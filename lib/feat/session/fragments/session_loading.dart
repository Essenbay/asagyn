part of '../session_screen.dart';

class _SessionLoading extends StatelessWidget {
  const _SessionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
