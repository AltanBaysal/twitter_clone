import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/constants/asset_constants.dart';
import 'package:twitter/ui/enums/page_state.dart';
import 'package:twitter/ui/helper/twitter_main_page_state_extension.dart';
import 'package:twitter/ui/widgets/drawer/twitter_drawer.dart';
import 'package:twitter/ui/widgets/twitter_bottom_navigaton_bar_item.dart';

int _currentIndex = 0;

class TwitterMainPage extends StatefulWidget {
  const TwitterMainPage({Key? key}) : super(key: key);

  @override
  _TwitterMainPageState createState() => _TwitterMainPageState();
}

class _TwitterMainPageState extends State<TwitterMainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: _currentIndex == 3
            ? SizedBox(
                height: height * 0.03,
                width: height * 0.03,
                child: SvgPicture.asset(
                    IconsConstant.floatingActionButtonMessagePageIcon,
                    color: Colors.white,
                    fit: BoxFit.cover),
              )
            : Icon(Icons.add, size: width * 0.08),
        onPressed: () {},
      ),
    
      drawer: const TwitterDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: width * 0.1,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        
        items: [
          TwitterBottomNavigationBarItem(
              height: height,
              icon: IconsConstant.twitterBottomNavigationBarItemHome,
              activeIcon: IconsConstant.bottomNavigationBarItemHomeFilled,
              label: ''),
          TwitterBottomNavigationBarItem(
              height: height,
              icon: IconsConstant.twitterBottomNavigationBarItemSearch,
              activeIcon:
                  IconsConstant.twitterBottomNavigationBarItemSearchFilled,
              label: ''),
          TwitterBottomNavigationBarItem(
              height: height,
              icon:
                  IconsConstant.twitterBottomNavigationBarItemItemNotifications,
              activeIcon: IconsConstant
                  .twitterBottomNavigationBarItemNotificationsFilled,
              label: ''),
          TwitterBottomNavigationBarItem(
              height: height,
              icon: IconsConstant.twitterBottomNavigationBarItemMessages,
              activeIcon: IconsConstant.twitterBottomNavigationBarItemFilled,
              label: ''),
        ],
      ),
    
      body: SafeArea(
        child:
            TwitterMainPageState.values[_currentIndex].twitterMainPageChooser(),
      ),
    );
  }
}
