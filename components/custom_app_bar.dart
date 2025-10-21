// ignore_for_file: prefer_final_fields, use_build_context_synchronously, deprecated_member_use, unused_local_variable, prefer_typing_uninitialized_variables, unused_element, unused_label, non_constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../provider/app_state_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? additionalActions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.additionalActions,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        final isDark = appState.isDarkMode;
        final backgroundColor =
            isDark ? AppTheme.accentBlack : AppTheme.pureWhite;
        final textColor = isDark ? AppTheme.textLight : AppTheme.textDark;

        return AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          iconTheme: IconThemeData(color: textColor),
          leading:
              showBackButton
                  ? IconButton(
                    icon: Icon(Icons.arrow_back, color: textColor),
                    onPressed: onBackPressed ?? () => Navigator.pop(context),
                  )
                  : null,
          actions: [
            // Language Toggle
            IconButton(
              icon: Icon(
                appState.isArabic ? Icons.language : Icons.translate,
                color: const Color.fromARGB(255, 240, 54, 193),
              ),
              onPressed: appState.toggleLanguage,
            ),
            // Theme Toggle
            IconButton(
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: const Color.fromARGB(255, 240, 54, 193),
              ),
              onPressed: appState.toggleDarkMode,
            ),
            // Additional menu for pages that need it
            if (title == 'Can Care System')
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  color: const Color.fromARGB(255, 240, 54, 193),
                ),
                onSelected: (String value) {
                  _handleMenuSelection(context, value, appState);
                },
                itemBuilder:
                    (BuildContext context) => [
                      PopupMenuItem<String>(
                        value: 'profile',
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: const Color.fromARGB(255, 240, 54, 193),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              appState.isArabic ? 'الملف الشخصي' : 'Profile',
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'settings',
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: const Color.fromARGB(255, 240, 54, 193),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              appState.isArabic ? 'الإعدادات' : 'Settings',
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'help',
                        child: Row(
                          children: [
                            Icon(
                              Icons.help,
                              color: const Color.fromARGB(255, 240, 54, 193),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              appState.isArabic ? 'المساعدة' : 'Help',
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'about',
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: const Color.fromARGB(255, 240, 54, 193),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              appState.isArabic ? 'حول التطبيق' : 'About',
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                      ),
                    ],
              ),
            // Add any additional actions passed from the parent
            if (additionalActions != null) ...additionalActions!,
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _handleMenuSelection(
    BuildContext context,
    String value,
    AppStateProvider appState,
  ) {
    final isArabic = appState.isArabic;

    switch (value) {
      case 'profile':
        _showDialog(
          context,
          DialogType.info,
          isArabic ? 'الملف الشخصي' : 'Profile',
          isArabic
              ? 'ميزة الملف الشخصي قيد التطوير'
              : 'Profile feature is under development',
        );
        break;
      case 'settings':
        _showDialog(
          context,
          DialogType.info,
          isArabic ? 'الإعدادات' : 'Settings',
          isArabic
              ? 'ميزة الإعدادات قيد التطوير'
              : 'Settings feature is under development',
        );
        break;
      case 'help':
        _showDialog(
          context,
          DialogType.info,
          isArabic ? 'المساعدة' : 'Help',
          isArabic
              ? 'للمساعدة، يرجى التواصل مع الدعم الفني'
              : 'For help, please contact technical support',
        );
        break;
      case 'about':
        _showDialog(
          context,
          DialogType.info,
          isArabic ? 'حول التطبيق' : 'About',
          isArabic
              ? 'Can Care System v1.0\nنظام الرعاية الصحية'
              : 'Can Care System v1.0\nHealthcare Management System',
        );
        break;
    }
  }

  void _showDialog(
    BuildContext context,
    DialogType type,
    String title,
    String desc,
  ) {
    if (!context.mounted) return;
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    final isArabic = appState.isArabic;

    AwesomeDialog(
      context: context,
      dialogType: type,
      title: title,
      desc: desc,
      btnOkOnPress: () {},
      btnOkText: isArabic ? 'حسناً' : 'OK',
    ).show();
  }
}
