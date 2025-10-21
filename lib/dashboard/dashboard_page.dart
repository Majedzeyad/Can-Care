// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../provider/app_state_provider.dart';
import '../components/custom_app_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        final isDark = appState.isDarkMode;
        final backgroundColor =
            isDark ? AppTheme.accentBlack : AppTheme.pureWhite;

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: CustomAppBar(
            title: appState.isArabic ? 'لوحة التحكم' : 'Dashboard',
            showBackButton: true,
          ),
          body: Directionality(
            textDirection:
                appState.isArabic ? TextDirection.rtl : TextDirection.ltr,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppTheme.primaryRed, AppTheme.darkRed],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryRed.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppTheme.pureWhite.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.dashboard,
                                color: AppTheme.pureWhite,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appState.isArabic
                                        ? 'لوحة التحكم'
                                        : 'Dashboard',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.pureWhite,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    appState.isArabic
                                        ? 'نظرة عامة على النظام'
                                        : 'System Overview',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppTheme.pureWhite.withOpacity(
                                        0.8,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Stats Cards
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.5,
                        ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return _buildStatCard(
                        _getStatData(index, appState.isArabic),
                        isDark,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatCard(Map<String, dynamic> data, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkGrey : AppTheme.pureWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: data['color'].withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(data['icon'], size: 32, color: data['color']),
            const SizedBox(height: 8),
            Text(
              data['value'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? AppTheme.textLight : AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              data['label'],
              style: TextStyle(
                fontSize: 12,
                color: (isDark ? AppTheme.textLight : AppTheme.textDark)
                    .withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> _getStatData(int index, bool isArabic) {
    final stats = [
      {
        'icon': Icons.directions_car,
        'value': '12',
        'label': isArabic ? 'السيارات' : 'Cars',
        'color': AppTheme.primaryRed,
      },
      {
        'icon': Icons.people,
        'value': '8',
        'label': isArabic ? 'العملاء' : 'Customers',
        'color': Colors.green,
      },
      {
        'icon': Icons.shopping_cart,
        'value': '5',
        'label': isArabic ? 'المبيعات' : 'Sales',
        'color': Colors.blue,
      },
      {
        'icon': Icons.attach_money,
        'value': '\$25K',
        'label': isArabic ? 'الإيرادات' : 'Revenue',
        'color': Colors.orange,
      },
    ];
    return stats[index];
  }
}
