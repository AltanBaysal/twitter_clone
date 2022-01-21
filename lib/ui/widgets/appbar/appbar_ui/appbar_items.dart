import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarProfile extends StatelessWidget {
  const AppbarProfile({
    Key? key,
    required this.image,
    required this.func,
  }) : super(key: key);

  final String image;
  final Function func;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: CircleAvatar(
        radius: width * 0.04,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}

class AppbarIconButton extends StatelessWidget {
  const AppbarIconButton({
    Key? key,
    required this.icon,
    required this.func,
  }) : super(key: key);

  final String icon;
  final Function func;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){func();},
      child: SizedBox(
        height: height * 0.031,
        width: height * 0.031,
        child: SvgPicture.asset(icon,
          fit: BoxFit.cover),
      ),
    );
  }
}

