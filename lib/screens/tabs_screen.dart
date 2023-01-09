import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.pink,
              tabs: [
                Tab(
                  text: 'Categories',
                  icon: Icon(
                    Icons.category,
                  ),
                ),
                Tab(
                  text: 'Favorites',
                  icon: Icon(
                    Icons.star,
                  ),
                ),
              ]),
        ),
        body: const TabBarView(children: [
          CategoriesScreen(),
          FavoritesScreen(),
        ]),
      ),
    );
  }
}
