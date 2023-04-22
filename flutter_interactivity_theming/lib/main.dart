import 'package:flutter/material.dart';
import 'package:flutter_interactivity_theming/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(59, 181, 120, 100),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(255, 5, 99, 125),
  brightness: Brightness.dark,
);

var kThemeData = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.onPrimaryContainer,
    foregroundColor: kColorScheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primaryContainer,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: kColorScheme.onSecondaryContainer,
        ),
      ),
  scaffoldBackgroundColor: kColorScheme.background,
);

var kDarkTheme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kDarkColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kDarkColorScheme.onPrimaryContainer,
    foregroundColor: kDarkColorScheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kDarkColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kDarkColorScheme.primaryContainer,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: kDarkColorScheme.onSecondaryContainer,
        ),
      ),
  scaffoldBackgroundColor: kDarkColorScheme.background,
);

void main() {
  runApp(MaterialApp(
    darkTheme: kDarkTheme,
    theme: kThemeData,
    //themeMode: ThemeMode.system, default
    home: const Expenses(),
  ));
}
