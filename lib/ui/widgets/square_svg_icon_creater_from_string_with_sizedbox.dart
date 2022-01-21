import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SquareSvgIconCreaterFromStringWithSizedBox extends StatelessWidget {
  const SquareSvgIconCreaterFromStringWithSizedBox({
    Key? key,
    required this.icon,
    required this.height,
  }) : super(key: key);

  final String icon;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: height,
      child: SvgPicture.asset(icon,
        fit: BoxFit.cover,
      ),
    );
  }
}
