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
      height: model.orders.isEmpty ? 0 : 125,
      collapsed: _ReceiptCollapsed(model: model),
      expandedBuilder: (controller) => _ReceiptExpanded(model: model),
      body: Stack(
        children: [
          //Background Image
          CachedNetworkImage(
            imageUrl: model.backgroundImage,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            height: context.screenSize.height * .4,
          ),
          //Image shadow
          Container(
            height: context.screenSize.height * .3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: context.screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton.small(
                            onPressed: () {
                              //CONSIDER: Add deeplink?
                              Share.share(
                                'Присоединяйся! Я в ${model.establishmentName}! Код заведения: ${model.establishmentCode}, Код стола: ${model.tableCode}',
                                subject:
                                    'Присоединяйся! Я в ${model.establishmentName}! Код заведения: ${model.establishmentCode}, Код стола: ${model.tableCode}',
                              );
                            },
                            child: Icon(
                              CupertinoIcons.share,
                              size: 20,
                            ),
                          ),
                          SessionPopupMenuButton(),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, bottom: 30, top: 10),
                    child: Text(
                      model.establishmentName,
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
                    child: model.orders.isEmpty
                        ? ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                height: context.screenSize.height * .5),
                            child: Center(
                              child: MessagedScreen(
                                //TODO: Change icon to like 'Empty order list'
                                iconPath: CustomIcons.menu,
                                message: 'Вы еще ничего не заказывали',
                                buttonText: 'Перейти в меню',
                                buttonOnTap: () => AutoTabsRouter.of(context)
                                    .setActiveIndex(1),
                              ),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 20),
                                child: Text('Заказы:',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Column(
                                children: model.orders
                                    .map((e) => OrderWidget(model: e))
                                    .toList(),
                              )
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
