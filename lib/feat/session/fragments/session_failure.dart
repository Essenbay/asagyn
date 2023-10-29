part of '../session_screen.dart';

class _SessionFailure extends StatelessWidget {
  const _SessionFailure({required this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenSize.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          image: CachedNetworkImageProvider(estab_background),
        ),
      ),
      child: Center(
        child: CustomErrorWidget(
          errorMessage: message,
          request: () =>
              context.read<SessionBloc>().add(const SessionEvent.fetch()),
        ),
      ),
    );
  }
}
