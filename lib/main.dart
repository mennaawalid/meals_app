import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'screens/filters_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    _filters = filterData;

    _availableMeals = dummyMeals.where((meal) {
      if (_filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  void _toggleFavorites(String mealId) {
    final exisitingIndex =
        _favoritedMeals.indexWhere((element) => element.id == mealId);

    if (exisitingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(exisitingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals
            .add(dummyMeals.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoritedMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            actionsIconTheme: IconThemeData(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            )),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineLarge: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 26,
              ),
              bodyText1: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              bodyText2: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
              headline5: const TextStyle(
                fontSize: 15,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.pink,
          onPrimary: Colors.white,
          secondary: Colors.amber,
        ),
      ),
      routes: {
        '/': (context) => TabsScreen(
              favMeals: _favoritedMeals,
            ),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealsDetailsScreen.routeName: (context) => MealsDetailsScreen(
              isFavorite: _isFavorite,
              toggleFavorites: _toggleFavorites,
            ),
        FiltersScreen.routeName: (context) => FiltersScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      },
    );
  }
}
