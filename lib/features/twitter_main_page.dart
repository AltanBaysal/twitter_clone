import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter/core/custom_widgets/twitter_bottom_navigaton_bar_item.dart';
import 'package:twitter/core/custom_widgets/twitter_drawer.dart';
import 'package:twitter/core/init/create_tweets.dart';
import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/core/init/page_chooser.dart';
import 'package:twitter/core/init/un_follow_users.dart';
import 'package:twitter/user_model.dart';




int _currentIndex = 0;

//? bu burda olmaması lazım değil mi ?
void create() {
  users = createUsers();
  selectUser(userEmail: "@Mr.Stark", password: "123456");
  tweets = createTweets();
  followUser();
}

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
        child: Icon(_currentIndex == 3 ? Icons.outgoing_mail : Icons.add,size: width * 0.08),
        onPressed: () {},
      ),
      
      drawer:const TwitterDrawer(),

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
          twitterBottomNavigationBarItem(height: height, icon: "images/birdhouse.svg", activeIcon: "images/birdhousefilled.svg"),

          twitterBottomNavigationBarItem(height: height, icon: "images/search.svg", activeIcon: "images/searchfilled.svg"),

          twitterBottomNavigationBarItem(height: height, icon: "images/bellring.svg", activeIcon: "images/bellringfilled.svg"),

          twitterBottomNavigationBarItem(height: height, icon: "images/letter.svg", activeIcon: "images/letterfilled.svg"),

        ],
      ),

      body: SafeArea(
        child: pagechooser(currentIndex:_currentIndex),
      ),
    
    );
  }
}


