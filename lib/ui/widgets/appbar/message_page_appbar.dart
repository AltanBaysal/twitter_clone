import 'package:flutter/material.dart';
import 'package:twitter/constants/asset_constants.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/screens/twitter_message_page_settings.dart';
import 'package:twitter/ui/helper/custom_slide_page_route.dart';
import 'package:twitter/ui/widgets/appbar/appbar_ui/appbar_items.dart';

import '../../../main.dart';

class MessagePageAppBar extends StatelessWidget {
  const MessagePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppbarProfile(
            image: selectedUser.userProfilePicture,
            func: () {
              Scaffold.of(context).openDrawer();
            }),
        InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.013, horizontal: width * 0.03),
            width: width * 0.63,
            decoration: const BoxDecoration(
                color: ColorsConstant.lightGrey,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(
              local.messagePageAppbarSearchTittle,
              style: TextStyle(
                  fontSize: width * 0.038, color: ColorsConstant.grey),
            ),
          ),
        ),
        AppbarIconButton(
            icon: IconsConstant.messagePageAppbarRightButton,
            func: () {
              Navigator.of(context).push(
                CustomSlidePageRoute(
                  direction: AxisDirection.up,
                  child: const MessagePageSetting(),
                ),
              );
            }),
      ],
    );
  }
}
