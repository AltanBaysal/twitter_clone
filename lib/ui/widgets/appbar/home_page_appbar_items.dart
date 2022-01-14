import 'package:flutter/material.dart';
import 'package:twitter/assets/constatns.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/appbar/appbar_ui/appbar_items.dart';

class HomepageAppBar extends StatelessWidget {
  const HomepageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppbarProfile(
            image: selectedUser.userProfilePicture,
            func: () {
              Scaffold.of(context).openDrawer();
            }),

        //? uygulama içindeki bütün Icon butonları tek bir widget olarak yazmalı mıyım?
        AppbarIconButton(icon: IconsConstant.homeAppbarMidIcon, func: () {}),

        AppbarIconButton(icon: IconsConstant.homeAppbarRighttIcon, func: () {}),
      ],
    );
  }
}
