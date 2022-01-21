import 'package:flutter/material.dart';
import 'package:twitter/ui/widgets/drawer/drawer_body/drawer_body_collapse.dart';
import 'package:twitter/ui/widgets/drawer/drawer_body/drawer_body_expanded.dart';
import 'package:twitter/ui/widgets/drawer/drawer_header/drawer_header.dart';


class TwitterDrawer extends StatefulWidget {
  const TwitterDrawer({Key? key}) : super(key: key);

  @override
  _TwitterDrawerState createState() => _TwitterDrawerState();
}

class _TwitterDrawerState extends State<TwitterDrawer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SizedBox(
        width: width * 0.88,
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CustomDrawerHeader(
                onChange: (){
                  setState(() {});
                },
              ),

              if(isArrowDown) ...[
                const DrawerBodyCollapseTopPart(),
                const DrawerBodyCollapseBottomPart(),
              ] 

              else if(!isArrowDown) const DrawerBodyExpanded()
            ],
          ),
        ),
      ),
    );
  }
}
