import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';

class AppbarUI extends StatelessWidget {
  const AppbarUI({
    Key? key,
    required this.appbaritems,
  }) : super(key: key);

  final Widget appbaritems;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 1,
      shadowColor: Colors.grey,
      automaticallyImplyLeading: false,
      floating: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: appbaritems,
      bottom: const PreferredSize(  //? sliverapp bar a alt çizgi eklemeyi sonunda başardım belki görmek istersin
        preferredSize: Size(double.infinity, 0.01),
        child: Divider(color: ColorsConstant.lightGrey,height: 0.01,),
      ),
    );
  }
}
