import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suxoy_zakon/cubit/cart_cubit.dart';
import 'package:suxoy_zakon/pages/confirmation_page.dart';
import 'package:suxoy_zakon/pages/main_page.dart';
import 'package:suxoy_zakon/pages/onboarding_page.dart';
import 'package:suxoy_zakon/pages/register_page.dart';
import 'package:suxoy_zakon/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    MyApp(
      isLogin: preferences.getBool("isLogin") ?? false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogin});
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: isLogin ? const MainPage() : const OnboardingPage(),
      ),
    );
  }
}
