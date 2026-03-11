import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stock_pilot/core/const/app_icons_const.dart';

class BackButtonCustomIcon extends StatelessWidget {
  const BackButtonCustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          Positioned(
            left: 8,
            top: 8,
            child: SizedBox(
              width: 24,
              height: 24,
              child: Stack(
                children: [
                  Positioned(
                    left: 4.99,
                    top: 4.99,
                    child: SvgPicture.asset(
                      AppIcons.backButtonIcon1,
                      width: 14,
                      height: 14,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    left: 4.99,
                    top: 12,
                    child: SvgPicture.asset(
                      AppIcons.backButtonIcon2,
                      width: 14,
                      height: 1,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
