import 'package:digital_manual/core/adaptive/font_size.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

abstract class AppButtons extends StatelessWidget {
  final VoidCallback onPress;
  final String label;
  final Color backgroundColor;
  final Color labelColor;
  final Icon? icon;
  const AppButtons({
    super.key,
    required this.onPress,
    required this.label,
    required this.backgroundColor,
    required this.labelColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: labelColor,
          fontSize: FontSize(context).regularText,
        ),
      ),
      icon: icon,
    );
  }
}

class PrimaryButton extends AppButtons {
  const PrimaryButton({
    super.key,
    required super.onPress,
    required super.label,
    super.backgroundColor = AppColors.primaryColor,
    super.labelColor = Colors.white,
  });
}

class SecondaryButton extends AppButtons {
  const SecondaryButton({
    super.key,
    required super.onPress,
    required super.label,
    super.backgroundColor = AppColors.backgroundColor,
    super.labelColor = AppColors.primaryColor,
  });
}

class AlertButton extends AppButtons {
  const AlertButton({
    super.key,
    required super.onPress,
    required super.label,
    super.backgroundColor = AppColors.errorColor,
    super.labelColor = Colors.white,
    super.icon = const Icon(Icons.delete, color: Colors.white),
  });
}
