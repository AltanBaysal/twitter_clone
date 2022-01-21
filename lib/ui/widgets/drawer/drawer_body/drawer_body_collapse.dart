import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/constants/asset_constants.dart';
import 'package:twitter/constants/english_constants.dart';
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

          const DrawerScrollViewButton(
            text: EnglishTexts.drawerScrollViewButtonTextProfile,
            icon: IconsConstant.drawerProfile,),
  
          const DrawerScrollViewButton(
              text: EnglishTexts.drawerScrollViewButtonTextLists,
              icon: IconsConstant.drawerLists,),

          const DrawerScrollViewButton(
              text: EnglishTexts.drawerScrollViewButtonTextTopics,
              icon: IconsConstant.drawerTopics,),

          const DrawerScrollViewButton(
              text: EnglishTexts.drawerScrollViewButtonTextBookmarks,
              icon: IconsConstant.drawerBookmarks,),

         const DrawerScrollViewButton(
              text: EnglishTexts.drawerScrollViewButtonTextMoments,
              icon: IconsConstant.drawerMoments,),
              
          const DrawerScrollViewButton(
              text: EnglishTexts.drawerScrollViewButtonTextMonetization,
              icon: IconsConstant.drawerMonetization,),

          Container(
            margin: EdgeInsets.only(
              bottom: height * 0.02,
              top: height * 0.02,
            ),
            height: 0.5,
            color: Colors.grey,
          ),

          const DrawerScrollViewButton(
              text: EnglishTexts.drawerScrollViewButtonTextTwitterForProfessionals,
              icon: IconsConstant.drawerTwitterForProfessionals,),
          
          Container(
            margin: EdgeInsets.only(
              bottom: height * 0.02,
              top: height * 0.02,
            ),
            height: 0.5,
            color: Colors.grey,
          ),
          
          const DrawerScrollViewButton(text: EnglishTexts.drawerScrollViewButtonTextSettingsAndPrivacy),

          const DrawerScrollViewButton(text: EnglishTexts.drawerScrollViewButtonTextHelpCenter),
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