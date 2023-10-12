import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFEEEEEE),
      primaryColor: const Color(0xFF27272A),
      cardColor: const Color(0xFFFFFFFF),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: const Color(0xFF1A94FF),
            tertiary: const Color(0xFF1A1A1A),
            background: const Color(0xFF808089),
          ),
      textTheme: TextTheme(
        bodyLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',
          color: Color(0xFF27272A),
        ),
        bodyMedium: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          color: Color(0xFF27272A),
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'Inter',
          color: const Color(0xFF27272A).withOpacity(0.5),
        ),
        labelMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Inter',
          color: Color(0xFF1A94FF),
        ),
      ),
    );
  }
}
