part of '../session_screen.dart';

class _SessionEmpty extends StatelessWidget {
  const _SessionEmpty();

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
        child: Column(
          children: [
            SvgPicture.asset(CustomIcons.emptyTable),
            Text('У вас нет никаких сессии'),
            const SizedBox(height: 10),
            PrimaryFilledTextButton(
                onPressed: () {}, text: context.localized.create_session),
          ],
        ),
      ),
    );
  }
}
