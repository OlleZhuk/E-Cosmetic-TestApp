import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../view_model/widgets/action_button.dart';
import '../view_model/widgets/drop_menu.dart';
import '../view_model/widgets/drop_menu_cupert.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Widget appBarTitle = Text('Фильтры');
    final scaffoldM = Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        toolbarHeight: 120,
      ),
      body: _MainContentM(),
    );
    final scaffoldC = CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: appBarTitle,
      ),
      child: _MainContentC(),
    );

    return defaultTargetPlatform == TargetPlatform.android
        ? scaffoldM
        : defaultTargetPlatform == TargetPlatform.iOS
            ? scaffoldC
            : scaffoldM;
  }
}

//
// Material content -------------------------
class _MainContentM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const List<String> filters = [
      'Сортировка',
      'Тип кожи',
      'Тип средства',
      'Проблема кожи',
      'Эффект средства',
      'Линия косметики',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        // Выпадающие меню
        children: [
          const SizedBox(height: 16),
          //
          Row(
            children: [
              _filterItemText(filters[0]),
              const Spacer(),
              const FiltersDropMenu(
                dropdownValue: 'По популярности',
                itemsList: [
                  'По популярности',
                  'По цене min-max',
                  'По цене max-min'
                ],
              )
            ],
          ),
          Row(
            children: [
              _filterItemText('Тип кожи'),
              const Spacer(),
              const FiltersDropMenu(
                dropdownValue: 'Нормальная',
                itemsList: [
                  'Жирная',
                  'Комбинированная',
                  'Нормальная',
                  'Сухая',
                  'Любой тип'
                ],
              )
            ],
          ),
          Row(
            children: [
              _filterItemText('Тип средства'),
              const Spacer(),
              const FiltersDropMenu(
                dropdownValue: 'Все',
                itemsList: [
                  'Все',
                  'Тип средства 1',
                  'Тип средства 2',
                ],
              )
            ],
          ),
          Row(
            children: [
              _filterItemText('Проблема кожи'),
              const Spacer(),
              const FiltersDropMenu(
                dropdownValue: 'Не выбрано',
                itemsList: [
                  'Не выбрано',
                  'Проблема 1',
                  'Проблема 2',
                ],
              )
            ],
          ),
          Row(
            children: [
              _filterItemText('Эффект средства'),
              const Spacer(),
              const FiltersDropMenu(
                dropdownValue: 'Увлажнение',
                itemsList: [
                  'Очищение',
                  'Увлажнение',
                  'Регенерация',
                ],
              )
            ],
          ),
          Row(
            children: [
              _filterItemText('Линия косметики'),
              const Spacer(),
              const FiltersDropMenu(
                dropdownValue: 'Все',
                itemsList: [
                  'Все',
                  'Линия 1',
                  'Линия 2',
                ],
              )
            ],
          ),
          const Spacer(),

          // Кнопка
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: actionButton(
                'Применить фильтры',
                const Color(0xFF2A2A2A),
                Colors.white,
                Colors.transparent,
                () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
// Cupertino content -------------------------
class _MainContentC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const List<String> filters = [
      'Сортировка',
      'Тип кожи',
      'Тип средства',
      'Проблема кожи',
      'Эффект средства',
      'Линия косметики',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          //
          CupertinoListTile(
              title: Text(filters[0]),
              trailing: MenuPickerButton(
                title: filters[0],
                initIndex: 0,
                itemsList: const [
                  'По популярности',
                  'По цене min-max',
                  'По цене max-min'
                ],
              )),
          CupertinoListTile(
              title: Text(filters[1]),
              trailing: MenuPickerButton(
                title: filters[1],
                initIndex: 2,
                itemsList: const [
                  'Жирная',
                  'Комбинированная',
                  'Нормальная',
                  'Сухая',
                  'Любой тип'
                ],
              )),
          CupertinoListTile(
              title: Text(filters[2]),
              trailing: MenuPickerButton(
                title: filters[2],
                initIndex: 0,
                itemsList: const [
                  'Все',
                  'Тип средства 1',
                  'Тип средства 2',
                ],
              )),
          CupertinoListTile(
              title: Text(filters[3]),
              trailing: MenuPickerButton(
                title: filters[3],
                initIndex: 0,
                itemsList: const [
                  'Не выбрано',
                  'Проблема 1',
                  'Проблема 2',
                ],
              )),
          CupertinoListTile(
              title: Text(filters[4]),
              trailing: MenuPickerButton(
                title: filters[4],
                initIndex: 1,
                itemsList: const [
                  'Очищение',
                  'Увлажнение',
                  'Регенерация',
                ],
              )),
          CupertinoListTile(
              title: Text(filters[5]),
              trailing: MenuPickerButton(
                title: filters[5],
                initIndex: 0,
                itemsList: const [
                  'Все',
                  'Линия 1',
                  'Линия 2',
                ],
              )),

          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CupertinoButton(
                color: const Color(0xFF2A2A2A),
                onPressed: () {},
                child: const Text('Применить фильтры'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _filterItemText(String text) => Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
