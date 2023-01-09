import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_screen';
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          Text(
            'Adjust your meal selection!',
            style: Theme.of(context).textTheme.headline6,
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  activeColor: Theme.of(context).colorScheme.primary,
                  title: const Text('Gluten-Free'),
                  value: _glutenFree,
                  subtitle: const Text('Only include gluten free meals.'),
                  onChanged: (newVlaue) {
                    setState(() {
                      _glutenFree = newVlaue;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Theme.of(context).colorScheme.primary,
                  title: const Text('Lactose-Free'),
                  value: _lactoseFree,
                  subtitle: const Text('Only include lactose free meals.'),
                  onChanged: (newVlaue) {
                    setState(() {
                      _lactoseFree = newVlaue;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Theme.of(context).colorScheme.primary,
                  title: const Text('Vegetarian'),
                  value: _isVegetarian,
                  subtitle: const Text('Only include vegetarian meals.'),
                  onChanged: (newVlaue) {
                    setState(() {
                      _isVegetarian = newVlaue;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Theme.of(context).colorScheme.primary,
                  title: const Text('Vegan'),
                  value: _isVegan,
                  subtitle: const Text('Only include vegan meals.'),
                  onChanged: (newVlaue) {
                    setState(() {
                      _isVegan = newVlaue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
