import 'package:flutter/material.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(fontSize: 14),
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
  ),
);
