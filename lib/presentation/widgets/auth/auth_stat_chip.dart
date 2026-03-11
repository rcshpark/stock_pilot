import 'package:stock_pilot/core/const/app_color_const.dart';
import 'package:stock_pilot/core/const/app_text_style_const.dart';
import 'package:flutter/material.dart';

class AuthStatChip extends StatelessWidget {
  const AuthStatChip({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.iconBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.panelBorder),
      ),
      child: Text(label, style: AppTextStyles.heroStat),
    );
  }
}
