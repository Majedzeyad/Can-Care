// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'app_theme.dart';

Widget buildTextField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  bool isPassword = false,
  required bool isDark,
  required Color textColor,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    style: TextStyle(color: textColor, fontSize: 14),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: textColor.withOpacity(0.7), fontSize: 13),
      prefixIcon: Icon(
        icon,
        color: const Color.fromARGB(255, 240, 54, 193),
        size: 20,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 240, 54, 193).withOpacity(0.3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 240, 54, 193).withOpacity(0.3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 240, 54, 193),
          width: 2,
        ),
      ),
      filled: true,
      fillColor: isDark ? AppTheme.accentBlack : AppTheme.lightGrey,
      isDense: true,
    ),
  );
}
