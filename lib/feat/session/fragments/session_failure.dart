part of '../session_screen.dart';

class _SessionFailure extends StatelessWidget {
  const _SessionFailure({required this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: CustomErrorWidget(
          errorMessage: message,
          isLight: false,
          request: () =>
              context.read<SessionBloc>().add(const SessionEvent.fetch()),
        ),
      ),
    );
  }
}
