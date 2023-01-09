import 'package:flutter/material.dart';

import 'screens/filters_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/': (context) => const TabsScreen(),
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealsDetailsScreen.routeName: (context) => const MealsDetailsScreen(),
        FiltersScreen.routeName: (context) => const FiltersScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      },
    );
  }
}
