import 'package:flutter/material.dart';
import 'package:twitter/constants/asset_constants.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/appbar/appbar_ui/appbar_items.dart';


class HomePageAppbarWithSearchBarAndSettings extends StatelessWidget {
  const HomePageAppbarWithSearchBarAndSettings({
    Key? key,
    required this.searchBarText,
    required this.searchBarFunc,
    required this.settingButtonFunc
  }) : super(key: key);

  final String searchBarText;
  final Function searchBarFunc;
  final Function settingButtonFunc;

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
          onTap: () {searchBarFunc();},
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.013, horizontal: width * 0.03),
            width: width * 0.63,
            decoration: const BoxDecoration(
                color: ColorsConstant.lightGrey,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(
              searchBarText,
              style: TextStyle(
                  fontSize: width * 0.038, color: ColorsConstant.grey),
            ),
          ),
        ),
        
        AppbarIconButton(
            icon: IconsConstant.messagePageAppbarRightButton,
            func: () {
              settingButtonFunc();
            }),
      ],
    );
  }
}
