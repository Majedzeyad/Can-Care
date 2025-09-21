// ignore_for_file: file_names, deprecated_member_use, non_constant_identifier_names, camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/app_state_provider.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types, must_be_immutable
class Sellf_Registration extends StatefulWidget {
  const Sellf_Registration({super.key});

  @override
  State<Sellf_Registration> createState() => _sanad_identityState();
}

class _sanad_identityState extends State<Sellf_Registration> {
  String? selectedOption;
  Widget? selectedContent;

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
                        appState.isArabic ? 'تسجيل ذاتي' : 'Sellf Registration',
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
                            const SizedBox(height: 5),
                            Column(
                              children: [
                                RadioListTile<String>(
                                  title: Text(
                                    appState.isArabic ? ' أردني' : 'Jordanian',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'jordanian',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value;
                                      selectedContent = _Jordanian(context);
                                    });
                                  },
                                  activeColor: const Color.fromARGB(
                                    255,
                                    240,
                                    54,
                                    193,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                ),
                                RadioListTile<String>(
                                  title: Text(
                                    appState.isArabic
                                        ? 'غير أردني'
                                        : 'Non Jordanian',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'non_jordanian',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value;
                                      selectedContent = _NonJordanian(context);
                                    });
                                  },
                                  activeColor: const Color.fromARGB(
                                    255,
                                    240,
                                    54,
                                    193,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                ),
                                RadioListTile<String>(
                                  title: Text(
                                    appState.isArabic ? 'عسكري' : 'Military',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  value: 'Military',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value;
                                      selectedContent = _Military(context);
                                    });
                                  },
                                  activeColor: const Color.fromARGB(
                                    255,
                                    240,
                                    54,
                                    193,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            // Display selected content
                            if (selectedContent != null) ...[
                              selectedContent!,
                              const SizedBox(height: 14),
                            ],

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

Widget _Jordanian(BuildContext context) {
  return Consumer<AppStateProvider>(
    builder: (context, appState, child) {
      final TextEditingController IDController = TextEditingController();
      final TextEditingController PhoneController = TextEditingController();
      final TextEditingController BirthController = TextEditingController();
      final TextEditingController IDnumberController = TextEditingController();
      final TextEditingController booknumberController =
          TextEditingController();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                TextField(
                  controller: IDController,
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic ? 'الرقم الوطني' : 'National ID',
                    prefixIcon: const Icon(Icons.perm_identity_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: PhoneController,
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic ? 'رقم الهاتف' : 'Phone Number',
                    prefixIcon: const Icon(Icons.local_phone_rounded),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: BirthController,
                  readOnly: true,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      BirthController.text = picked.toString().split(' ')[0];
                    }
                  },
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic ? 'تاريخ الميلاد' : 'Date Of Birth',
                    prefixIcon: const Icon(Icons.calendar_month),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: IDnumberController,
                  decoration: InputDecoration(
                    labelText: appState.isArabic ? 'رقم الهوية ' : 'ID number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: booknumberController,
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic
                            ? 'رقم دفتر العائلة '
                            : 'Family book number',
                    prefixIcon: const Icon(Icons.family_restroom_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget _NonJordanian(BuildContext context) {
  return Consumer<AppStateProvider>(
    builder: (context, appState, child) {
      final TextEditingController IDController = TextEditingController();
      final TextEditingController PhoneController = TextEditingController();
      final TextEditingController BirthController = TextEditingController();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                TextField(
                  controller: IDController,
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic ? 'الرقم الشخصي' : 'Personal number',
                    prefixIcon: const Icon(Icons.perm_identity_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: PhoneController,
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic ? 'رقم الهاتف' : 'Phone Number',
                    prefixIcon: const Icon(Icons.local_phone_rounded),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: BirthController,
                  readOnly: true,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      BirthController.text = picked.toString().split(' ')[0];
                    }
                  },
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic ? 'تاريخ الميلاد' : 'Date Of Birth',
                    prefixIcon: const Icon(Icons.calendar_month),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget _Military(BuildContext context) {
  return Consumer<AppStateProvider>(
    builder: (context, appState, child) {
      final TextEditingController IDController = TextEditingController();
      final TextEditingController PhoneController = TextEditingController();
      final TextEditingController BirthController = TextEditingController();
      final TextEditingController IDnumberController = TextEditingController();
      final TextEditingController booknumberController =
          TextEditingController();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                TextField(
                  controller: IDController,
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic ? 'الرقم الوطني' : 'National ID',
                    prefixIcon: const Icon(Icons.perm_identity_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: PhoneController,
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic ? 'رقم الهاتف' : 'Phone Number',
                    prefixIcon: const Icon(Icons.local_phone_rounded),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: BirthController,
                  readOnly: true,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      BirthController.text = picked.toString().split(' ')[0];
                    }
                  },
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic ? 'تاريخ الميلاد' : 'Date Of Birth',
                    prefixIcon: const Icon(Icons.calendar_month),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: IDnumberController,
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic
                            ? 'الرقم العسكري '
                            : 'Military number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: booknumberController,
                  decoration: InputDecoration(
                    labelText:
                        appState.isArabic
                            ? 'رقم دفتر العائلة '
                            : 'Family book number',
                    prefixIcon: const Icon(Icons.family_restroom_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
