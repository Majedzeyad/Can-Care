import 'package:flutter/material.dart';
import 'package:flutter_application_1/information/main_screen.dart';
import 'package:provider/provider.dart';
//import 'information/log_in.dart';
import 'theme/app_theme.dart';
import 'provider/app_state_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppStateProvider(),
      child: Consumer<AppStateProvider>(
        builder: (context, appState, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appState.isArabic ? 'Can Care System' : 'Can Care System',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
