import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getThemeData() {
    return ThemeData(
        textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(
              fontSize: 18,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
            )));
  }
}
