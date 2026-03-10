import 'package:ai_news_analyzer/core/const/app_color_const.dart';
import 'package:ai_news_analyzer/core/const/app_text_style_const.dart';
import 'package:ai_news_analyzer/presentation/widgets/auth/auth_divider.dart';
import 'package:ai_news_analyzer/presentation/widgets/auth/auth_field.dart';
import 'package:ai_news_analyzer/presentation/widgets/auth/auth_primary_button.dart';
import 'package:ai_news_analyzer/presentation/widgets/auth/auth_secondary_button.dart';
import 'package:ai_news_analyzer/presentation/widgets/auth/auth_stat_chip.dart';
import 'package:ai_news_analyzer/presentation/widgets/auth_shell.dart';
import 'package:ai_news_analyzer/presentation/widgets/email_icon.dart';
import 'package:ai_news_analyzer/presentation/widgets/lock_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AuthShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHero(l10n),
          const SizedBox(height: 28),
          AuthField(
            hintText: l10n.email,
            icon: const EmailIcon(),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 14),
          AuthField(
            hintText: l10n.password,
            icon: const LockIcon(),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          AuthPrimaryButton(
            text: l10n.loginToStart,
            icon: Icons.auto_awesome_rounded,
            onPressed: () {},
          ),
          const SizedBox(height: 18),
          AuthDivider(text: l10n.or),
          const SizedBox(height: 18),
          AuthSecondaryButton(
            text: l10n.guestToStart,
            icon: Icons.arrow_forward_rounded,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 6,
              children: [
                Text(l10n.noAccount, style: AppTextStyles.greyText),
                GestureDetector(
                  onTap: () => context.push('/signup'),
                  child: Text(l10n.signUp, style: AppTextStyles.accentBlueText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.iconBackground,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.panelBorder),
          ),
          child: const Text('AI NEWS ANALYZER', style: AppTextStyles.eyebrow),
        ),
        const SizedBox(height: 18),
        Text(l10n.introTitle, style: AppTextStyles.introTitle),
        const SizedBox(height: 12),
        Text(l10n.introSubTitle, style: AppTextStyles.introSubtitle),
        const SizedBox(height: 20),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            AuthStatChip(label: 'Bias detection'),
            AuthStatChip(label: 'Summary snapshots'),
            AuthStatChip(label: 'Source comparison'),
          ],
        ),
      ],
    );
  }
}
