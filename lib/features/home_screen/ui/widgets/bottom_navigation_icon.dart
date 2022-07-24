import 'package:even/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationIcon extends StatelessWidget {
  const BottomNavigationIcon({
    Key key,
    @required this.iconPath,
    @required this.isActive,
  }) : super(key: key);
  final String iconPath;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      color: isActive ? AppColors.color0055FF : AppColors.black,
    );
  }
}
