import 'package:flutter/material.dart';

class AppbarUI extends StatelessWidget {
  const AppbarUI({
    Key? key,
    required this.appbaritems,
  }) : super(key: key);

  final Widget appbaritems;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      backgroundColor: Colors.white,
      title: appbaritems,
    );
  }
}
