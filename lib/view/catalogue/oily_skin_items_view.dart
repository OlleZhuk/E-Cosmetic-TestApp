import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../view_model/clean_up_view.dart';
import '../../view_model/hydrate_view.dart';
import '../../view_model/regeneration_view.dart';
import '../../view_model/widgets/bttm_nav_bar_cupert.dart';
import '../../view_model/widgets/bttm_nav_bar_mater.dart';

enum Categories { cleanup, hydrate, regeneration }

class OilySkinItemsView extends StatefulWidget {
  const OilySkinItemsView({super.key});

  @override
  State<OilySkinItemsView> createState() => _OilySkinItemsViewState();
}

class _OilySkinItemsViewState extends State<OilySkinItemsView> {
  int _selectedPageIndex = 1;
  Categories _selectedSegment = Categories.cleanup;
  Widget currentPage = const CleanUpItemsView();
  static const tabsPaddingM =
      EdgeInsets.symmetric(horizontal: 14); // для внутреннего текста
  static const tabsPaddingC = EdgeInsets.symmetric(horizontal: 14);

  Map<Categories, Widget> pagesCupert = <Categories, Widget>{
    Categories.cleanup: const CleanUpItemsView(),
    Categories.hydrate: const HydrateItemsView(),
    Categories.regeneration: const RegenerationItemsView(),
  };

  final List<Widget> pagesMater = [
    const CleanUpItemsView(),
    const HydrateItemsView(),
    const RegenerationItemsView(),
  ];

  //* Метод переключения индекса вкладки
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });

    if (index == 0) {
      setState(() {
        Navigator.of(context).pushReplacementNamed('/');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int counter = 28;

    // Динамический счетчик +правильные окончания
    List<Widget> rowPrefix = [
      Text(
        '$counter',
        style: const TextStyle(fontSize: 12),
      ),
      Text(
        (counter % 100 > 4 && counter % 100 < 21)
            ? ' продуктов'
            : (counter % 10 == 1)
                ? ' продукт'
                : (counter % 10 > 1 && counter % 10 < 5)
                    ? ' продукта'
                    : ' продуктов',
        style: const TextStyle(fontSize: 12),
      ),
    ];

    final scaffoldM = DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 120,
            title: const Text('Средства для жирной кожи'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 8),
                    child: Row(
                      children: rowPrefix +
                          [
                            const Spacer(),
                            IconButton(
                              onPressed: () =>
                                  Navigator.of(context).pushNamed('/filters'),
                              icon: const Icon(Icons.tune_outlined),
                            ),
                          ],
                    ),
                  ),
                  const TabBar(
                    labelPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                      color: Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    tabs: [
                      Padding(
                        padding: tabsPaddingM,
                        child: Tab(text: 'Очищение'),
                      ),
                      Padding(
                        padding: tabsPaddingM,
                        child: Tab(text: 'Увлажнение'),
                      ),
                      Padding(
                        padding: tabsPaddingM,
                        child: Tab(text: 'Регенерация'),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        body: TabBarView(children: pagesMater),
        bottomNavigationBar: bottmNavBarMaterial(
          _selectedPageIndex,
          _selectPage,
        ),
      ),
    );

    final scaffoldC = CupertinoPageScaffold(
      child: bottmNavBarCupertino(
        _selectedPageIndex,
        _selectPage,
        CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              middle: Column(
                children: [
                  const Text('Средства для жирной кожи'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: rowPrefix,
                  )
                ],
              ),
              trailing: Material(
                child: IconButton(
                  onPressed: () => Navigator.of(context).pushNamed('/filters'),
                  icon: const Icon(
                    Icons.tune_outlined,
                  ),
                ),
              ),
              largeTitle: CupertinoSegmentedControl<Categories>(
                groupValue: _selectedSegment,
                selectedColor: Colors.black87,
                onValueChanged: (Categories value) {
                  setState(() {
                    _selectedSegment = value;
                    currentPage = pagesCupert[_selectedSegment]!;
                  });
                },
                children: const <Categories, Widget>{
                  Categories.cleanup: Padding(
                    padding: tabsPaddingC,
                    child: Text('Очищение'),
                  ),
                  Categories.hydrate: Padding(
                    padding: tabsPaddingC,
                    child: Text('Увлажнение'),
                  ),
                  Categories.regeneration: Padding(
                    padding: tabsPaddingC,
                    child: Text('Регенерация'),
                  ),
                },
              ),
            ),
            currentPage,
          ],
        ),
      ),
    );

    return defaultTargetPlatform == TargetPlatform.android
        ? scaffoldM
        : defaultTargetPlatform == TargetPlatform.iOS
            ? scaffoldC
            : scaffoldM;
  }
}
