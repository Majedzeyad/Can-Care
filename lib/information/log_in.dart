// ignore_for_file: prefer_final_fields, use_build_context_synchronously, deprecated_member_use, unused_local_variable, prefer_typing_uninitialized_variables, unused_element, unused_label, non_constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/information/Facility_Registration.dart';
import 'package:flutter_application_1/information/Sellf_Registration.dart';
import 'package:flutter_application_1/information/sanad_identity.dart';
import 'home.dart';
import '../theme/app_theme.dart';
import '../provider/app_state_provider.dart';
import 'package:provider/provider.dart';
import '../theme/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/custom_app_bar.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

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
                      const SizedBox(height: 14),
                      Text(
                        appState.isArabic ? 'مرحباً بك' : 'Welcome Back',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        appState.isArabic
                            ? 'سجل دخولك للوصول إلى النظام'
                            : 'Sign in to access your account',
                        style: TextStyle(
                          fontSize: 12,
                          color: textColor.withOpacity(0.7),
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
                            buildTextField(
                              controller: _emailController,
                              label:
                                  appState.isArabic
                                      ? 'البريد الإلكتروني'
                                      : 'Email',
                              icon: Icons.email,
                              isDark: isDark,
                              textColor: textColor,
                            ),
                            const SizedBox(height: 10),
                            buildTextField(
                              controller: _passwordController,
                              label:
                                  appState.isArabic
                                      ? 'كلمة المرور'
                                      : 'Password',
                              icon: Icons.lock,
                              isPassword: true,
                              isDark: isDark,
                              textColor: textColor,
                            ),
                            const SizedBox(height: 14),
                            SizedBox(
                              width: double.infinity,
                              height: 42,
                              child: ElevatedButton(
                                onPressed: _isLoading ? null : _signIn,
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
                                child:
                                    _isLoading
                                        ? const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                            color: AppTheme.pureWhite,
                                            strokeWidth: 2,
                                          ),
                                        )
                                        : Text(
                                          appState.isArabic
                                              ? 'تسجيل الدخول'
                                              : 'Sign In',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () => _forgotPassword(context),
                                    child: Text(
                                      appState.isArabic
                                          ? 'نسيت كلمة المرور؟'
                                          : 'Forgot Password?',
                                      style: TextStyle(
                                        color: textColor.withOpacity(0.8),
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () => _contactus(context),
                                    child: Text(
                                      appState.isArabic
                                          ? 'اتصل بنا'
                                          : 'Contact Us',
                                      style: TextStyle(
                                        color: textColor.withOpacity(0.8),
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () => _createAccount(context),
                                    child: Text(
                                      appState.isArabic
                                          ? 'إنشاء حساب'
                                          : 'createAccount',
                                      style: TextStyle(
                                        color: textColor.withOpacity(0.8),
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
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

  Future<void> _signIn() async {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    final isArabic = appState.isArabic;

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showDialog(
        context,
        DialogType.warning,
        isArabic ? 'حقول مطلوبة' : 'Fields Required',
        isArabic
            ? 'يرجى إدخال البريد الإلكتروني وكلمة المرور'
            : 'Please enter email and password',
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'invalid-email':
          message =
              isArabic ? 'البريد الإلكتروني غير صالح' : 'Invalid email address';
          break;
        case 'user-disabled':
          message =
              isArabic
                  ? 'تم تعطيل هذا المستخدم'
                  : 'This user has been disabled';
          break;
        case 'user-not-found':
          message =
              isArabic
                  ? 'لم يتم العثور على مستخدم'
                  : 'No user found for that email';
          break;
        case 'wrong-password':
          message = isArabic ? 'كلمة المرور غير صحيحة' : 'Incorrect password';
          break;
        case 'too-many-requests':
          message =
              isArabic
                  ? 'محاولات عديدة. حاول لاحقاً'
                  : 'Too many attempts. Try again later';
          break;
        default:
          message =
              isArabic ? 'حدث خطأ غير متوقع' : 'An unexpected error occurred';
      }
      _showDialog(
        context,
        DialogType.error,
        isArabic ? 'فشل تسجيل الدخول' : 'Sign-in Failed',
        message,
      );
    } catch (_) {
      _showDialog(
        context,
        DialogType.error,
        isArabic ? 'خطأ' : 'Error',
        isArabic ? 'تعذر تسجيل الدخول' : 'Could not sign in',
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _contactus(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    final isArabic = appState.isArabic;

    _showDialog(
      context,
      DialogType.info,
      isArabic ? 'اتصل بنا' : 'Contact Us',
      isArabic
          ? 'للدعم، يرجى إرسال بريد إلكتروني:\nmajedhrzallah@gmail.com\n\nأو اتصل:\n+962 790 261 823'
          : 'For support, please email:\nmajedhrzallah@gmail.com\n\nOr call:\n+962 790 261 823',
    );
  }

  void _forgotPassword(BuildContext context) async {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    final isArabic = appState.isArabic;

    final emailText = _emailController.text.trim();

    if (emailText.isEmpty) {
      _showDialog(
        context,
        DialogType.warning,
        isArabic ? 'البريد الإلكتروني مطلوب' : 'Email Required',
        isArabic
            ? 'يرجى إدخال عنوان بريدك الإلكتروني'
            : 'Please enter your email address',
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailText);
      _showDialog(
        context,
        DialogType.success,
        isArabic ? 'تم الإرسال' : 'Email Sent',
        isArabic
            ? 'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك.'
            : 'Password reset link has been sent to your email.',
      );
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'invalid-email':
          message =
              isArabic ? 'البريد الإلكتروني غير صالح' : 'Invalid email address';
          break;
        case 'user-not-found':
          message =
              isArabic
                  ? 'لا يوجد مستخدم لهذا البريد'
                  : 'No user found for that email';
          break;
        default:
          message =
              isArabic ? 'تعذر إرسال البريد' : 'Could not send reset email';
      }
      _showDialog(
        context,
        DialogType.error,
        isArabic ? 'فشل الإرسال' : 'Failed',
        message,
      );
    } catch (_) {
      _showDialog(
        context,
        DialogType.error,
        isArabic ? 'خطأ' : 'Error',
        isArabic ? 'حدث خطأ غير متوقع' : 'An unexpected error occurred',
      );
    }
  }

  void _showDialog(
    BuildContext context,
    DialogType type,
    String title,
    String desc,
  ) {
    if (!mounted) return;
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

String? selected;

void _createAccount(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          Provider.of<AppStateProvider>(context, listen: false).isArabic
              ? 'إنشاء حساب'
              : 'Create Account',
        ),
        content: StatefulBuilder(
          builder: (context, setState) {
            return DropdownButton<String>(
              value: selected,
              hint: Text(
                Provider.of<AppStateProvider>(context, listen: false).isArabic
                    ? 'حدد خيار'
                    : 'Select an option',
              ),
              items: [
                DropdownMenuItem(
                  value: 'Sign_up_with_sanad_Digital_identity',
                  child: Text(
                    Provider.of<AppStateProvider>(
                          context,
                          listen: false,
                        ).isArabic
                        ? 'سجل بإستخدام هوية سند الرقمية'
                        : 'Sign up with sanad Digital identity',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Sellf_Registration',
                  child: Text(
                    Provider.of<AppStateProvider>(
                          context,
                          listen: false,
                        ).isArabic
                        ? 'التسجيل الذاتي'
                        : 'Self Registration',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Facility Registration',
                  child: Text(
                    Provider.of<AppStateProvider>(
                          context,
                          listen: false,
                        ).isArabic
                        ? 'تسجيل من المنشأة'
                        : 'Facility Registration',
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selected = value!;
                });
              },
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (selected == 'Sign_up_with_sanad_Digital_identity') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const sanad_identity(),
                  ),
                );
              } else if (selected == 'Sellf_Registration') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sellf_Registration(),
                  ),
                );
              } else if (selected == 'Facility Registration') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FacilityRegistration(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select an option')),
                );
              }
            },
            child: Text(
              Provider.of<AppStateProvider>(context, listen: false).isArabic
                  ? 'أكمل'
                  : 'Continue',
            ),
          ),
        ],
      );
    },
  );
}
