// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../provider/app_state_provider.dart';
import '../components/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        final isDark = appState.isDarkMode;
        final backgroundColor =
            isDark ? AppTheme.accentBlack : AppTheme.pureWhite;
        final textColor = isDark ? AppTheme.textLight : AppTheme.textDark;

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: CustomAppBar(title: appState.isArabic ? 'الرئيسية' : 'Home'),
          body: Directionality(
            textDirection:
                appState.isArabic ? TextDirection.rtl : TextDirection.ltr,
            child: Center(
              child: Text(
                appState.isArabic
                    ? 'مرحباً بك في النظام'
                    : 'Welcome to the System',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
