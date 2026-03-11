import 'package:stock_pilot/core/const/app_color_const.dart';
import 'package:stock_pilot/core/const/app_text_style_const.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    required this.hintText,
    required this.icon,
    super.key,
    this.keyboardType,
    this.obscureText = false,
  });

  final String hintText;
  final Widget icon;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBackground2_60,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.panelBorder),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: AppTextStyles.textInputField,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.hintText,
          prefixIcon: Padding(padding: const EdgeInsets.all(14), child: icon),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 52,
            minHeight: 52,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}
