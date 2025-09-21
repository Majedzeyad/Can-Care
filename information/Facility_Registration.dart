// ignore_for_file: file_names, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/app_state_provider.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types, must_be_immutable
class FacilityRegistration extends StatefulWidget {
  const FacilityRegistration({super.key});

  @override
  State<FacilityRegistration> createState() => _FacilityRegistrationState();
}

class _FacilityRegistrationState extends State<FacilityRegistration> {
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
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              appState.isArabic ? 'Can Care System' : 'Can Care System',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            iconTheme: IconThemeData(color: textColor),
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
            ],
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
                      const SizedBox(height: 14),
                      Text(
                        appState.isArabic
                            ? 'تسجيل المنشأة'
                            : 'Facility Registration',
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
                                        ? 'الرجاء مراجعة المنشأة الصحية (العيادة، المستشفى، المركز الصحي ...إلخ) للحصول على رمز الاشتراك ثم ادخاله بالحقل أدناه'
                                        : 'Please visit the healthcare facility (clinic, hospital, health center, etc.) to obtain the subscription code and then enter it in the field below',
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
                                        ? 'أدخل رقم الإشتراك الخاص بك'
                                        : 'Enter your Enrollment Code',
                                prefixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    appState.isArabic
                                        ? 'بعد إنشاء الحساب الرجاء الموافقة على أن خصوصية معلومات الحساب تحت طائلة المسؤولية القانونية'
                                        : 'After creating an account, please agree that the privacy of account information is subject to legal liability',
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
                                  appState.isArabic ? 'تسجيل' : 'Register',
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
