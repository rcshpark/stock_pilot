import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stock_pilot/core/const/app_icons_const.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.userIcon,
      width: 20,
      height: 20,
      fit: BoxFit.contain,
    );
  }
}
