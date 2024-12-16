import 'package:e_cosm_test/view_model/widgets/catalogue_sheets_cupert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../view_model/widgets/action_button.dart';
import '../../view_model/widgets/bttm_nav_bar_cupert.dart';
import '../../view_model/widgets/bttm_nav_bar_mater.dart';
import '../../view_model/widgets/catalogue_sheets_mater.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedPageIndex = 1;

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
    final scaffoldM = Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Поиск',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ),
      ),
      body: _MainCatalogueContent(),
      bottomNavigationBar: bottmNavBarMaterial(
        _selectedPageIndex,
        _selectPage,
      ),
    );

    final scaffoldC = CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: CupertinoSearchTextField(placeholder: 'Поиск'),
      ),
      child: bottmNavBarCupertino(
        _selectedPageIndex,
        _selectPage,
        _MainCatalogueContent(),
      ),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: defaultTargetPlatform == TargetPlatform.android
          ? scaffoldM
          : defaultTargetPlatform == TargetPlatform.iOS
              ? scaffoldC
              : scaffoldM,
    );
  }
}

class _MainCatalogueContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _activeButton('Назначение', () {}),
            _activeButton('Тип средства', () {}),
            _activeButton('Тип кожи', () {
              defaultTargetPlatform == TargetPlatform.android
                  ? skinTypeBottomSheetM(context)
                  : defaultTargetPlatform == TargetPlatform.iOS
                      ? skinTypeBottomSheetC(context)
                      : skinTypeBottomSheetM(context);
            }),
            _activeButton('Линия косметики', () {}),
            _activeButton('Наборы', () {}),
            Row(
              children: [
                _activeButton('Акции', () {}),
                Image.asset(scale: 2, 'assets/images/pink.png'),
              ],
            ),
            _activeButton('Консультация\nс косметологом', () {}),
            const SizedBox(height: 16),
            //
            // СХЕМА ДОМАШНЕГО УХОДА ---------
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.asset(
                  'assets/images/3.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Составим схему идеального\nдомашнего ухода',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '10 вопросов о вашей коже',
                        style: TextStyle(fontSize: 13),
                      ),
                      const SizedBox(height: 16),
                      actionButton(
                        'Пройти тест',
                        const Color(0xFF2A2A2A),
                        Colors.white,
                        const Color(0xFF2A2A2A),
                        () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _activeButton(String text, void Function() action) => TextButton(
      onPressed: action,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
