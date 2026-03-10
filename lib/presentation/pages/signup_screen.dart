import 'package:ai_news_analyzer/core/const/app_color_const.dart';
import 'package:ai_news_analyzer/core/const/app_text_style_const.dart';
import 'package:ai_news_analyzer/presentation/widgets/auth/auth_divider.dart';
import 'package:ai_news_analyzer/presentation/widgets/auth/auth_field.dart';
import 'package:ai_news_analyzer/presentation/widgets/auth/auth_primary_button.dart';
import 'package:ai_news_analyzer/presentation/widgets/auth/auth_social_button.dart';
import 'package:ai_news_analyzer/presentation/widgets/auth_shell.dart';
import 'package:ai_news_analyzer/presentation/widgets/email_icon.dart';
import 'package:ai_news_analyzer/presentation/widgets/github_icon.dart';
import 'package:ai_news_analyzer/presentation/widgets/google_icon.dart';
import 'package:ai_news_analyzer/presentation/widgets/lock_icon.dart';
import 'package:ai_news_analyzer/presentation/widgets/user_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AuthShell(
      header: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          onPressed: () => context.pop(),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.iconBackground,
            foregroundColor: AppColors.white,
            side: const BorderSide(color: AppColors.panelBorder),
            fixedSize: const Size(44, 44),
          ),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.signUp, style: AppTextStyles.sectionLabel),
          const SizedBox(height: 8),
          const Text(
            'Create your workspace and compare narratives across sources.',
            style: AppTextStyles.supportingText,
          ),
          const SizedBox(height: 24),
          AuthSocialButton(
            text: l10n.continueWithGoogle,
            icon: const GoogleIcon(),
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          AuthSocialButton(
            text: l10n.continueWithGithub,
            icon: const GithubIcon(),
            onPressed: () {},
          ),
          const SizedBox(height: 22),
          AuthDivider(text: l10n.signUpWithEmail),
          const SizedBox(height: 22),
          AuthField(hintText: l10n.name, icon: const UserIcon()),
          const SizedBox(height: 12),
          AuthField(
            hintText: l10n.email,
            icon: const EmailIcon(),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          AuthField(
            hintText: l10n.password,
            icon: const LockIcon(),
            obscureText: true,
          ),
          const SizedBox(height: 12),
          AuthField(
            hintText: l10n.confirmPassword,
            icon: const LockIcon(),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: agreedToTerms,
                onChanged: (value) {
                  setState(() {
                    agreedToTerms = value ?? false;
                  });
                },
                activeColor: AppColors.buttonBlue,
                side: const BorderSide(color: AppColors.panelBorder),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Wrap(
                    children: [
                      Text(
                        l10n.agreeTo,
                        style: AppTextStyles.termsAndConditionsText,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          l10n.termsAndConditions,
                          style: AppTextStyles.termsAndConditionsLink,
                        ),
                      ),
                      Text(
                        l10n.and,
                        style: AppTextStyles.termsAndConditionsText,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          l10n.privacyPolicy,
                          style: AppTextStyles.termsAndConditionsLink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          AuthPrimaryButton(text: l10n.signUpButton, onPressed: () {}),
          const SizedBox(height: 20),
          Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 6,
              children: [
                Text(
                  l10n.alreadyHaveAccount,
                  style: AppTextStyles.loginPromptText,
                ),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Text(l10n.login, style: AppTextStyles.loginPromptLink),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
