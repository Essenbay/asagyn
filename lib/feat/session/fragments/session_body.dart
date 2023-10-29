part of '../session_screen.dart';

class _SessionBody extends StatelessWidget {
  const _SessionBody({required this.model});
  final SessionModel model;
  @override
  Widget build(BuildContext context) {
    return BottomSheetBar(
      locked: false,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32.0),
        topRight: Radius.circular(32.0),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1.0,
          blurRadius: 15.0,
        ),
      ],
      height: 125,
      collapsed: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 50,
                height: 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.greyLight.withOpacity(.5)),
              ),
            ),
            const SizedBox(height: 10),
            Row(children: [
              Text(
                'Итого:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                '1550 ₸',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ]),
            const SizedBox(height: 10),
            PrimaryFilledTextButton(onPressed: () {}, text: 'Попросить счет'),
          ],
        ),
      ),
      expandedBuilder: (controller) => Container(),
      body: SingleChildScrollView(
        child: Container(
          width: context.screenSize.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              image: CachedNetworkImageProvider(estab_background),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Text(
                  'Title',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Заказы:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      Column(
                        children: [],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
