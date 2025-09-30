import 'package:flutter/material.dart';
import 'package:islami_app_route/utils/app_colors.dart';

class AppTheme {
  static ThemeData dartheme = ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
      ),
      scaffoldBackgroundColor: AppColors.transparentColor,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.blackbgColor,
          iconTheme: IconThemeData(color: AppColors.primaryColor)));
}
