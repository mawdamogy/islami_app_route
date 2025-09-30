import 'package:flutter/material.dart';
import 'package:islami_app_route/ui/home/home_screen.dart';
import 'package:islami_app_route/ui/home/taps/quran/details/sura_details_screen.dart';
import 'package:islami_app_route/ui/home/taps/quran/details2/sura_details_screen2.dart';
import 'package:islami_app_route/utils/app_routes.dart';
import 'package:islami_app_route/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.dartheme,
      initialRoute: AppRoutes.homeroute,
      routes: {
        AppRoutes.homeroute: (context) => const HomeScreen(),
        AppRoutes.souradetails2route :(context)=>const SuraDetailsScreen2(),
        },
    );
  }
}
