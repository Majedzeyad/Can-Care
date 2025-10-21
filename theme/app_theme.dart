import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData.light();
  static ThemeData get darkTheme => ThemeData.dark();

  // Added minimal color tokens to satisfy references
  static const Color accentBlack = Color(0xFF121212);
  static const Color pureWhite = Colors.white;
  static const Color textLight = Colors.white;
  static const Color textDark = Colors.black87;
  static const Color primaryRed = Color(0xFFE53935);
  static const Color darkRed = Color(0xFFB71C1C);
  static const Color darkGrey = Color(0xFF303030);
  static const Color lightGrey = Color(0xFFF2F2F2);
}
