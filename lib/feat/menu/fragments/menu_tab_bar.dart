import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/widgets/category_item.dart';
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
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
                labelColor: AppColors.primary,
                padding: EdgeInsets.zero,
                indicatorColor: AppColors.primary,
                indicatorPadding: EdgeInsets.zero,
                tabs: widget.model.categories
                    .map((e) => Tab(child: Text(e.name)))
                    .toList(),
              ),
        Expanded(
            child: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          children: widget.model.categories
              .map(
                (category) => GridView.builder(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 8, bottom: 10),
                  itemCount: category.products.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: .60,
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
