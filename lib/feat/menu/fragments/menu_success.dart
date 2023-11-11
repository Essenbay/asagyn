part of '../menu_screen.dart';

class MenuSuccess extends StatefulWidget {
  const MenuSuccess({super.key, required this.model});
  final MenuModel model;
  @override
  State<MenuSuccess> createState() => _MenuSuccessState();
}

class _MenuSuccessState extends State<MenuSuccess> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                hintText: 'Поиск',
                prefix: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(Icons.search)),
              ),
            ),
            SizedBox(
              height: 55,
              width: 55,
              child: SortButton(
                  onSelected: (newValue) async => setState(
                        () {
                          widget.model.sortProducts(newValue);
                        },
                      )),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(child: MenuTabBar(model: widget.model)),
        _CartFloatedModal(),
      ],
    );
  }
}
