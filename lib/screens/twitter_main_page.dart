import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter/assets/constatns.dart';
import 'package:twitter/ui/helper/page_chooser.dart';
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
        child: Icon(_currentIndex == 3 ? Icons.outgoing_mail : Icons.add,
            size: width * 0.08),
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
          twitterBottomNavigationBarItem(
              height: height,
              icon: IconsConstant.bottomNavigationBarItemHome,
              activeIcon: IconsConstant.bottomNavigationBarItemHomeFilled),
          twitterBottomNavigationBarItem(
              height: height,
              icon: IconsConstant.bottomNavigationBarItemSearch,
              activeIcon: IconsConstant.bottomNavigationBarItemSearchFilled),
          twitterBottomNavigationBarItem(
              height: height,
              icon: IconsConstant.bottomNavigationBarItemNotifications,
              activeIcon: IconsConstant.bottomNavigationBarItemNotificationsFilled),
          twitterBottomNavigationBarItem(
              height: height,
              icon: IconsConstant.bottomNavigationBarItemMessages,
              activeIcon: IconsConstant.bottomNavigationBarItemMessagesFilled),
        ],
      ),
      body: SafeArea(
        child: PageChooser(currentIndex: _currentIndex),
      ),
    );
  }
}
