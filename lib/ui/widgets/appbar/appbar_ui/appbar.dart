import 'package:flutter/material.dart';

class AppbarUI extends StatelessWidget {
  const AppbarUI({
    Key? key,
    required this.appbaritems,
  }) : super(key: key);

  final Widget appbaritems;

  @override
  Widget build(BuildContext context) {

    //? alt çizgi ekleyemiyorum
    return SliverAppBar(
      elevation: 1,
      shadowColor: Colors.grey,
      automaticallyImplyLeading: false,
      floating: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: appbaritems
    );
  }
}
