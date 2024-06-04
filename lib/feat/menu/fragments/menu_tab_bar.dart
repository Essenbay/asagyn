import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/menu/logic/menu_model.dart';
import 'package:zakazflow/feat/menu/widgets/product_detail.dart';
import 'package:zakazflow/feat/menu/widgets/menu_product_grid_item.dart';

class MenuTabBar extends StatefulWidget {
  const MenuTabBar(
      {super.key, required this.model, required this.filteredProducts});
  final MenuModel model;
  final List<ProductModel> filteredProducts;
  @override
  State<MenuTabBar> createState() => _MenuTabBarState();
}

class _MenuTabBarState extends State<MenuTabBar> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: widget.model.categories.length + 1, vsync: this);

  bool isCategoriesExpanded = false;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: AppColors.primary,
          padding: EdgeInsets.zero,
          indicatorColor: AppColors.primary,
          indicatorPadding: EdgeInsets.zero,
          tabs: [
            Tab(
              child: Text(context.localized.all),
            ),
            ...widget.model.categories.map((e) {
              return Tab(child: Text(e.name));
            }).toList()
          ],
        ),
        Expanded(
            child: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          children: [
            productsView(context, null),
            ...widget.model.categories
                .map((category) => productsView(context, category))
                .toList()
          ],
        ))
      ],
    );
  }

  Widget productsView(BuildContext context, CategoryModel? category) {
    if (category == null) {
      return GridView.builder(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 10),
        itemCount: widget.filteredProducts.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: .60,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            showProductDetail(context, widget.filteredProducts[index]);
          },
          child: MenuProductGridItem(
            model: widget.filteredProducts[index],
          ),
        ),
      );
    }

    final products = widget.filteredProducts
        .where((product) =>
            product.categoryDTOS.where((c) => c.id == category.id).isNotEmpty)
        .toList();

    return GridView.builder(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: .60,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          showProductDetail(context, products[index]);
        },
        child: MenuProductGridItem(
          model: products[index],
        ),
      ),
    );
  }
}
