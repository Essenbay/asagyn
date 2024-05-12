part of '../session_screen.dart';

class _SessionBody extends StatelessWidget {
  const _SessionBody({required this.model, required this.orders});
  final SessionModel model;
  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    final orderItems = orders.fold<List<OrderItem>>(
        [], (prev, curr) => [...prev, ...curr.orderItemDTOS]);
    final total = orderItems.fold(
        0.0, (prev, curr) => prev + (curr.cost * curr.quantity));

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
      height: orders.isEmpty ? 0 : 110,
      collapsed: ReceiptCollapsed(
        model: model,
        total: total,
      ),
      expandedBuilder: (controller) => ReceiptExpanded(
        model: model,
        orderItems: orderItems,
        total: total,
      ),
      body: Stack(
        children: [
          //Background Image
          if (model.establishmentDTO.backgroundImage != null)
            ServerImage(
              imageUrl: model.establishmentDTO.backgroundImage!,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              height: context.screenSize.height * .4,
              width: context.screenSize.width,
            )
          else
            Container(
              constraints:
                  BoxConstraints(maxHeight: context.screenSize.height * .5),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primary,
                    AppColors.primary400,
                    AppColors.primary300,
                    AppColors.primary200,
                    AppColors.white,
                  ],
                ),
              ),
            ),

          //Image shadow
          if (model.establishmentDTO.backgroundImage != null)
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlocBuilder<FetchProfileBloc, FetchProfileState>(
                          builder: (context, state) {
                            return state.maybeMap(
                              success: (profileState) => SessionPopupMenuButton(
                                model: model,
                                profile: profileState.data,
                              ),
                              orElse: () => const SizedBox(),
                            );
                          },
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 40, top: 10),
                  child: Text(
                    model.establishmentDTO.establishmentName,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints.tightFor(
                      height: context.screenSize.height * .5),
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: orders.isEmpty
                      ? Center(
                          child: MessagedScreen(
                            iconPath: CustomIcons.order,
                            message: context.localized.orders_empty,
                            buttonText: context.localized.to_menu,
                            buttonOnTap: () =>
                                AutoTabsRouter.of(context).setActiveIndex(1),
                          ),
                        )
                      : ListView(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Text('${context.localized.orders}:',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600)),
                            ),
                            ...orders
                                .map((e) => OrdersWidget(model: e))
                                .toList()
                                .reversed,
                            const SizedBox(height: 100),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
