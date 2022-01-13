import 'package:flutter/material.dart';
import 'package:twitter/assets/constatns.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/appbar/appbar_items.dart';

class MessagePageAppBar extends StatelessWidget {
  const MessagePageAppBar({Key? key}) : super(key: key);

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

        AppbarIconButton(icon: "assets/icons/settings.svg", func: () {}),
      ],
    );
  }
}