import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

BottomNavigationBarItem twitterBottomNavigationBarItem({required double height,required String icon,required String activeIcon}) {
  return BottomNavigationBarItem(
    icon: SizedBox(
      height: height * 0.04,
      width: height * 0.04,
      child: SvgPicture.asset(
        icon,
        fit: BoxFit.cover,
      ),
    ),
    activeIcon: SizedBox(
      height: height * 0.04,
      width: height * 0.04,
      child: SvgPicture.asset(activeIcon, fit: BoxFit.cover),
    ),
    label:"",
  );
}
