import 'dart:ui';

import 'package:ai_news_analyzer/core/const/app_color_const.dart';
import 'package:flutter/material.dart';

class AuthShell extends StatelessWidget {
  const AuthShell({
    required this.child,
    super.key,
    this.header,
    this.maxWidth = 440,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
  });

  final Widget child;
  final Widget? header;
  final double maxWidth;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.darkBackground1,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.darkBackground1,
              AppColors.darkBackground2,
              AppColors.darkBackground1,
            ],
          ),
        ),
        child: Stack(
          children: [
            const _BackdropOrb(
              alignment: Alignment.topRight,
              color: AppColors.glowBlue,
              size: 220,
              offset: Offset(72, -40),
            ),
            const _BackdropOrb(
              alignment: Alignment.topLeft,
              color: AppColors.glowCyan,
              size: 180,
              offset: Offset(-80, 56),
            ),
            const _BackdropOrb(
              alignment: Alignment.bottomCenter,
              color: AppColors.glowBlueSoft,
              size: 280,
              offset: Offset(0, 96),
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: padding,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (header != null) ...[
                          header!,
                          const SizedBox(height: 20),
                        ],
                        ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                24,
                                28,
                                24,
                                24,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.panelBackground,
                                border: Border.all(
                                  color: AppColors.panelBorder,
                                ),
                                borderRadius: BorderRadius.circular(32),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColors.panelShadow,
                                    blurRadius: 40,
                                    offset: Offset(0, 24),
                                  ),
                                ],
                              ),
                              child: child,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackdropOrb extends StatelessWidget {
  const _BackdropOrb({
    required this.alignment,
    required this.color,
    required this.size,
    required this.offset,
  });

  final Alignment alignment;
  final Color color;
  final double size;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: offset,
        child: IgnorePointer(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [color, color.withValues(alpha: 0)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
