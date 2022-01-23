import 'package:flutter/material.dart';
import 'package:twitter/ui/widgets/common/square_svg_icon_creater_from_string_with_sizedbox.dart';


//*
class TwitterBottomNavigationBarItem extends BottomNavigationBarItem {
  TwitterBottomNavigationBarItem({
    Key? key,
    required double height,
    required String label,
    required String icon,
    required String activeIcon})
    : super(
      icon: SquareSvgIconCreaterFromStringWithSizedBox(icon: icon, height: height * 0.04),
      activeIcon: SquareSvgIconCreaterFromStringWithSizedBox(icon: activeIcon, height: height * 0.04),
      label: label
    );

  BottomNavigationBarItem build(BuildContext context){
    return BottomNavigationBarItem(
      icon: icon,
      activeIcon: activeIcon,
      label: label,
    );
  }
}



