import 'package:stock_pilot/core/const/app_color_const.dart';
import 'package:stock_pilot/core/const/app_text_style_const.dart';
import 'package:flutter/material.dart';

class AuthSecondaryButton extends StatelessWidget {
  const AuthSecondaryButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.panelBorder),
          foregroundColor: AppColors.guestButtonText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: onPressed,
        iconAlignment: IconAlignment.end,
        icon: Icon(icon, size: 18),
        label: Text(text, style: AppTextStyles.guestButtonText),
      ),
    );
  }
}
