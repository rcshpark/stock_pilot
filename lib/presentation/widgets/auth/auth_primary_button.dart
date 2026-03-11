import 'package:stock_pilot/core/const/app_color_const.dart';
import 'package:stock_pilot/core/const/app_text_style_const.dart';
import 'package:flutter/material.dart';

class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.icon,
  });

  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: icon == null
          ? ElevatedButton(
              style: _style(),
              onPressed: onPressed,
              child: Text(text, style: AppTextStyles.loginButtonText),
            )
          : ElevatedButton.icon(
              style: _style(),
              onPressed: onPressed,
              icon: Icon(icon, size: 18),
              label: Text(text, style: AppTextStyles.loginButtonText),
            ),
    );
  }

  ButtonStyle _style() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.buttonBlue,
      foregroundColor: AppColors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    );
  }
}
