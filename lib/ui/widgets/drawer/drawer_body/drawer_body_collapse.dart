import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/constants/asset_constants.dart';
import 'package:twitter/main.dart';
import 'drawer_scrollview_button.dart';


class DrawerBodyCollapseTopPart extends StatelessWidget {
  const DrawerBodyCollapseTopPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    
    return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: height * 0.02, top: height * 0.02),
            height: 0.5,
            color: Colors.grey,
          ),

          DrawerScrollViewButton(
            text: local.drawerScrollViewButtonTextProfile,
            icon: IconsConstant.drawerProfile,),
  
          DrawerScrollViewButton(
              text: local.drawerScrollViewButtonTextLists,
              icon: IconsConstant.drawerLists,),

          DrawerScrollViewButton(
              text: local.drawerScrollViewButtonTextTopics,
              icon: IconsConstant.drawerTopics,),

          DrawerScrollViewButton(
              text: local.drawerScrollViewButtonTextBookmarks,
              icon: IconsConstant.drawerBookmarks,),

         DrawerScrollViewButton(
              text: local.drawerScrollViewButtonTextMoments,
              icon: IconsConstant.drawerMoments,),
              
          DrawerScrollViewButton(
              text: local.drawerScrollViewButtonTextMonetization,
              icon: IconsConstant.drawerMonetization,),

          Container(
            margin: EdgeInsets.only(
              bottom: height * 0.02,
              top: height * 0.02,
            ),
            height: 0.5,
            color: Colors.grey,
          ),

          DrawerScrollViewButton(
              text: local.drawerScrollViewButtonTextTwitterForProfessionals,
              icon: IconsConstant.drawerTwitterForProfessionals,),
          
          Container(
            margin: EdgeInsets.only(
              bottom: height * 0.02,
              top: height * 0.02,
            ),
            height: 0.5,
            color: Colors.grey,
          ),
          
          DrawerScrollViewButton(text: local.drawerScrollViewButtonTextSettingsAndPrivacy),

          DrawerScrollViewButton(text: local.drawerScrollViewButtonTextHelpCenter),
        ],
      ),
    ),
  );

  }
}

class DrawerBodyCollapseBottomPart extends StatelessWidget {
  const DrawerBodyCollapseBottomPart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(width: 0.5, color: Colors.grey)),
    ),
    padding:
        EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: height * 0.03,
          width: height * 0.03,
          child: SvgPicture.asset(IconsConstant.drawerLamp, fit: BoxFit.cover),
        ),
        SizedBox(
          height: height * 0.03,
          width: height * 0.03,
          child:
              SvgPicture.asset(IconsConstant.drawerQrCode, fit: BoxFit.cover),
        ),
      ],
    ),
  );
  }
}