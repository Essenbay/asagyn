import 'package:flutter/material.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/widgets/category_item.dart';
import 'package:zakazflow/feat/menu/widgets/iconed_divider.dart';
import 'package:zakazflow/feat/menu/widgets/product_detail.dart';
import 'package:zakazflow/feat/menu/widgets/menu_product_grid_item.dart';

class MenuTabBar extends StatefulWidget {
  const MenuTabBar({super.key, required this.model});
  final MenuModel model;

  @override
  State<MenuTabBar> createState() => _MenuTabBarState();
}

class _MenuTabBarState extends State<MenuTabBar> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: widget.model.categories.length, vsync: this);

  bool isCategoriesExpanded = false;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isCategoriesExpanded
            ? GridView.builder(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount: widget.model.categories.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 170,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1),
                itemBuilder: (context, index) {
                  final item = widget.model.categories[index];
                  return CategoryItem(
                    imagePath: item.image,
                    title: item.name,
                    isSelected: index == _tabController.index,
                    onClick: () => setState(() {
                      isCategoriesExpanded = false;
                      _tabController.animateTo(index);
                    }),
                  );
                },
              )
            : TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: widget.model.categories
                    .map((e) => Tab(child: Text(e.name)))
                    .toList(),
              ),
        // IconedDivider(
        //   isExpanded: false,
        //   toggle: () => setState(() {
        //     isCategoriesExpanded = !isCategoriesExpanded;
        //   }),
        // ),
        Expanded(
            child: TabBarView(
          physics: BouncingScrollPhysics(),
          controller: _tabController,
          children: widget.model.categories
              .map(
                (category) => GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  itemCount: category.products.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 170,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: .62,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () =>
                        showProductDetail(context, category.products[index]),
                    child: MenuProductGridItem(
                      model: category.products[index],
                    ),
                  ),
                ),
              )
              .toList(),
        ))
      ],
    );
  }
}
