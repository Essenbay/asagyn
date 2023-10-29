part of '../session_screen.dart';

class _SessionEmpty extends StatelessWidget {
  const _SessionEmpty();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            CustomIcons.emptyTable,
            height: 100,
          ),
          const SizedBox(height: 20),
          Text(
            'У вас нет никаких сессии',
            style: context.theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          PrimaryFilledTextButton(
              onPressed: () {}, text: context.localized.create_session),
        ],
      ),
    );
  }
}
