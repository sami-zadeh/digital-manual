import 'package:digital_manual/core/constants/colors.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'gilroy',
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    primary: AppColors.primaryColor,
    error: AppColors.errorColor,
    errorContainer: AppColors.lightErrorColor,
    secondary: AppColors.secondaryColor,
  ),
  textTheme: const TextTheme().apply(
    bodyColor: AppColors.textColor,
    displayColor: AppColors.textColor,
  ),
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
