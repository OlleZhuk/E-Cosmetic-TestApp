import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/action_products.dart';
import '../models/hit_products.dart';
import '../models/home_care_scheme.dart';
import '../models/new_products.dart';
import '../models/product_lines.dart';
import '../view_model/widgets/action_button.dart';
import '../view_model/widgets/bttm_nav_bar_cupert.dart';
import '../view_model/widgets/bttm_nav_bar_mater.dart';
import '../view_model/widgets/carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  //* Метод переключения индекса вкладки
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });

    if (index == 1) {
      setState(() {
        Navigator.of(context).pushReplacementNamed('/catalogue');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    Size prefAppBarHeight = Size.fromHeight(
      defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS
          ? width * .8
          : 240600 / width, // для web - уменьшение
    );
    // каркасы для разных платформ:
    final scaffoldM = Scaffold(
        appBar: PreferredSize(
          preferredSize: prefAppBarHeight,
          child: _AppBarContent(),
        ),
        body: _MainHomeScrContent(),
        bottomNavigationBar: bottmNavBarMaterial(
          _selectedPageIndex,
          _selectPage,
        ));
    //
    final scaffoldC = CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Каталог',
          style: TextStyle(fontSize: 24),
        ),
      ),
      child: bottmNavBarCupertino(
        _selectedPageIndex,
        _selectPage,
        _MainHomeScrContent(),
      ),
    );
    return defaultTargetPlatform == TargetPlatform.android
        ? scaffoldM
        : defaultTargetPlatform == TargetPlatform.iOS
            ? scaffoldC
            : scaffoldM;
  }
}

class _Category extends StatelessWidget {
  const _Category({required this.categoryTitle, required this.gradient});

  final String categoryTitle;
  final List<Color> gradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Container(
            width: 118,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: gradient,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: PopupMenuButton<String>(
          icon: const Icon(CupertinoIcons.ellipsis),
          iconColor: Colors.white,
          iconSize: 30,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: '1',
              child: Text('Пункт1'),
            ),
            const PopupMenuItem(
              value: '2',
              child: Text('Пункт2'),
            ),
          ],
          onSelected: (value) {},
        ),
        flexibleSpace: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hl01.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 150,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black87,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: ListTile(
                title: const Text(
                  'Скидка -15%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Сыворотка\nHA EYE & NECK SERUM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    actionButton(
                      'Перейти к акции',
                      Colors.transparent,
                      Colors.white,
                      Colors.white,
                      () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class _MainHomeScrContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final conWidth = constraints.maxWidth;
        final correctWidth = conWidth * .4;

        return ListView(
          children: [
            //
            // ЛИНЕЙКИ КОСМЕТИКИ --------------
            // прокрутка
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Row(
                    children: cosmLines.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: conWidth * .2,
                          height: conWidth * .26,
                          alignment: Alignment.center,
                          child: item,
                        ),
                      );
                    }).toList(),
                  ),
                )),
            //
            // карусель НОВИНКИ ---------------
            const _Category(
              categoryTitle: 'Новинки',
              gradient: [Color(0xFFE3FDF8), Colors.cyanAccent],
            ),
            ProductsCarousel(
              itemList:
                  newProducts.map((item) => Container(child: item)).toList(),
            ),
            //
            // СХЕМА ДОМАШНЕГО УХОДА ---------
            // прокрутка
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.asset('assets/images/3.png', fit: BoxFit.fitWidth),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Моя схема домашнего ухода',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Row(
                              children: homeCare.map((type) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0),
                                  child: Container(
                                    width: conWidth * .22,
                                    height: conWidth * .28,
                                    alignment: Alignment.center,
                                    child: type,
                                  ),
                                );
                              }).toList(),
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Ответьте на 10 вопросов,\nи мы подберем нужный уход',
                            style: TextStyle(fontSize: 13),
                          ),
                          actionButton(
                            'Пройти тест',
                            const Color(0xFF2A2A2A),
                            Colors.white,
                            const Color(0xFF2A2A2A),
                            () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //
            // карусель АКЦИИ ---------------
            const _Category(
              categoryTitle: 'Акции',
              gradient: [Color(0xFFFFD5E3), Colors.pinkAccent],
            ),
            ProductsCarousel(
              itemList:
                  actionProducts.map((item) => Container(child: item)).toList(),
            ),
            //
            // 4 КНОПКИ --------------------
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                bottom: 18,
                top: 10,
              ),
              child: Center(
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: correctWidth,
                        child: _fourButtons('Для очищения', () {}),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: correctWidth,
                        child: _fourButtons('Для увлажнения', () {}),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: correctWidth,
                        child: _fourButtons('Для питания', () {}),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: correctWidth,
                        child: _fourButtons('Для омоложения', () {}),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //
            // карусель ХИТЫ ---------------
            const _Category(
              categoryTitle: 'Хиты',
              gradient: [Color(0xFFFFE1D7), Colors.deepOrangeAccent],
            ),
            ProductsCarousel(
              itemList:
                  hitProducts.map((item) => Container(child: item)).toList(),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}

Widget _fourButtons(
  String buttonText,
  void Function() action,
) =>
    TextButton(
      onPressed: action,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 1),
          // radius 8 - like CupertinoButton has
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    );
