import 'package:flutter/material.dart';
import 'package:twitter/ui/drawer/drawer_body/drawer_body_first_position.dart';
import 'package:twitter/ui/drawer/drawer_body/drawer_body_second_position.dart';
import 'package:twitter/ui/drawer/drawer_header/drawer_header.dart';


class TwitterDrawer extends StatefulWidget {
  const TwitterDrawer({Key? key}) : super(key: key);

  @override
  _TwitterDrawerState createState() => _TwitterDrawerState();
}

class _TwitterDrawerState extends State<TwitterDrawer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SizedBox(
        width: width * 0.88,
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const drawerHeader(),

              if(isArrowDown) ...[
                drawerBodyFirstPositionUpperPart(height: height, width: width),
                drawerBodyFirstPositionLowerPart(height: height, width: width),
              ] 

              else if(!isArrowDown) const DrawerBodySecondPosition()
            ],
          ),
        ),
      ),
    );
  }
}
