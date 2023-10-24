import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  textTheme: TextTheme(
      bodyMedium: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
      labelSmall: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontWeight: FontWeight.w500,
          fontSize: 14)),
  scaffoldBackgroundColor: Color.fromARGB(255, 53, 53, 53),
  colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 55, 55, 55)),
  dividerColor: Colors.white10,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.amber,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 53, 53, 53),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  useMaterial3: true,
);
