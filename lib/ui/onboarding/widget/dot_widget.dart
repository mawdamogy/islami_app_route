import 'package:flutter/material.dart';
import 'package:islami_app_route/utils/app_colors.dart';

class DotWidget extends StatelessWidget {
  DotWidget({super.key, required this.isselected});
  bool isselected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: isselected ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isselected ? AppColors.primaryColor : Colors.grey,
      ),
    );
  }
}
