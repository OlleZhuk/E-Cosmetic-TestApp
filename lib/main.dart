import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'view/catalogue/catalogue_screen.dart';
import 'view/catalogue/oily_skin_items_view.dart';
import 'view/filters_screen.dart';
import 'view/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = <String, WidgetBuilder>{
      '/': (context) => const HomeScreen(),
      '/catalogue': (context) => const CatalogueScreen(),
      // '/cart': (context) => const MyPage(title: Text('page B')),
      // '/user': (context) => const MyPage(title: Text('page C')),
      '/oilySkinItems': (context) => const OilySkinItemsView(),
      '/filters': (context) => const FiltersScreen(),
    };
    final material = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 30),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          showUnselectedLabels: true,
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 24,
          ),
        ),
      ),
      initialRoute: '/',
      routes: routes,
    );
    final cupertino = CupertinoApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
    );

    return defaultTargetPlatform == TargetPlatform.android
        ? material
        : defaultTargetPlatform == TargetPlatform.iOS
            ? cupertino
            : material;
  }
}
