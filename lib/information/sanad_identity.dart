// ignore_for_file: file_names, deprecated_member_use, non_constant_identifier_names, camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/app_state_provider.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:provider/provider.dart';
import '../components/custom_app_bar.dart';

// ignore: camel_case_types, must_be_immutable
class sanad_identity extends StatefulWidget {
  const sanad_identity({super.key});

  @override
  State<sanad_identity> createState() => _sanad_identityState();
}

class _sanad_identityState extends State<sanad_identity> {
  final TextEditingController Facilit_number = TextEditingController();

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
          appBar: CustomAppBar(
            title: appState.isArabic ? 'Can Care System' : 'Can Care System',
          ),
          body: Directionality(
            textDirection:
                appState.isArabic ? TextDirection.rtl : TextDirection.ltr,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 350),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(
                                240,
                                54,
                                193,
                                1,
                              ).withOpacity(0.3),
                              blurRadius: 25,
                              offset: const Offset(1, 7),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset(
                            'images/logo.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        appState.isArabic
                            ? 'هوية سند الرقمية'
                            : 'sanad identity',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 18),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              isDark ? AppTheme.darkGrey : AppTheme.pureWhite,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(
                                255,
                                240,
                                54,
                                193,
                              ).withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 7),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    appState.isArabic
                                        ? 'التحقق من الرقم الوطني'
                                        : 'National ID Validation',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: textColor,
                                      height: 1.4,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            TextField(
                              controller: Facilit_number,
                              decoration: InputDecoration(
                                labelText:
                                    appState.isArabic
                                        ? 'أدخل الرقم الوطني الخاص بك'
                                        : 'Enter your National ID ',
                                prefixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),

                            SizedBox(
                              width: double.infinity,
                              height: 42,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your registration logic here
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    240,
                                    54,
                                    193,
                                  ),
                                  foregroundColor: const Color.fromARGB(
                                    255,
                                    0,
                                    0,
                                    0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 3,
                                ),
                                child: Text(
                                  appState.isArabic ? 'تحقق' : 'Validate',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
