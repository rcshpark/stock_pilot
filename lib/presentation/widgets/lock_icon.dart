import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stock_pilot/core/const/app_icons_const.dart';

class LockIcon extends StatelessWidget {
  const LockIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.lockIcon,
      width: 20,
      height: 20,
      fit: BoxFit.contain,
    );
  }
}
