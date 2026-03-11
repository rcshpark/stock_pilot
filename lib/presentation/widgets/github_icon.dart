import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stock_pilot/core/const/app_icons_const.dart';

class GithubIcon extends StatelessWidget {
  const GithubIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.githubIcon,
      width: 20,
      height: 20,
      fit: BoxFit.contain,
    );
  }
}
