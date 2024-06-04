part of '../menu_screen.dart';

class MenuSuccess extends StatefulWidget {
  const MenuSuccess({super.key, required this.model});
  final MenuModel model;
  @override
  State<MenuSuccess> createState() => _MenuSuccessState();
}

class _MenuSuccessState extends State<MenuSuccess> {
  late final filteredList = [...widget.model.productItemDTOs];

  void sortProducts(SortValue sortType) {
    switch (sortType) {
      case SortValue.name:
        filteredList.sort((a, b) => a.nameEn.compareTo(b.nameEn));
        break;
      case SortValue.cheapFirst:
        filteredList.sort((a, b) => a.cost.compareTo(b.cost));
        break;
      case SortValue.expensiveFirst:
        filteredList.sort((a, b) => b.cost.compareTo(a.cost));
        break;
    }
    setState(() {});
  }

  void setSeatchData(Languages currLanguage, String value) {
    filteredList.clear();

    if (value.isEmpty) {
      filteredList.addAll(widget.model.productItemDTOs);
    } else {
      final resultList = widget.model.productItemDTOs.where((element) {
        final productName = switch (currLanguage) {
          Languages.ru => element.nameRu,
          Languages.kz => element.nameKz,
          Languages.en => element.nameEn,
        };
        return productName.contains(value);
      });
      filteredList.addAll(resultList);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: BlocBuilder<LanguageCubit, Languages>(
                builder: (context, state) {
                  return CustomTextField(
                    hintText: context.localized.search,
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(Icons.search),
                    ),
                    onChanged: (value) => setSeatchData(
                      state,
                      value,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 55,
              width: 55,
              child: SortButton(
                  onSelected: (newValue) async => setState(
                        () {
                          sortProducts(newValue);
                        },
                      )),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: MenuTabBar(
            model: widget.model,
            filteredProducts: filteredList,
          ),
        ),
        const _CartFloatedModal(),
      ],
    );
  }
}
