import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter/core/init/tweet.dart';
import 'package:twitter/user.dart';
import 'core/init/create_users.dart';

int _currentIndex = 0;

void create() {
  List<User> users = createUsers();
  selectUser("@Mr.Stark", "123456");

  users[1].createTweet("bu başka birine ait bir tweettir");
  users[2].createTweet("bu üçünçü kişiye ait bir tweettir");

  users[1].createTweet("bu başka birine ait fotoğraflı bir tweettir",
      image:
          "https://storage.googleapis.com/nrpassets/uploads/articles/1561556167-google_main.jpg");

  users[2].createTweet("""bu üçünçü kişiye ait bir fotoğraflı tweettir 
  
New York !!!""",
      image:
          "https://trthaberstatic.cdn.wp.trt.com.tr/resimler/1530000/new-york-depophotos-1531803_2.jpg");
}

void main() {
  create();
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: TwitterMainPage(),
    );
  }
}

class TwitterMainPage extends StatefulWidget {
  TwitterMainPage({Key? key}) : super(key: key);
  final tweets = [
    selectedUser.createTweet("Bu bir tweettir"),
    selectedUser.createTweet("Bu başka bir tweettir"),
    selectedUser.createTweet("Bu Fotoğraflı bir tweettir",
        image:
            "http://static1.squarespace.com/static/5be156f4365f02418a904b89/5c6bd79f419202ebf60c713d/5c7ee6ed085229c0b8891384/1571346599322/mindset%2Bnot%2Ba%2Blocation.jpg?format=1500w"),
  ];
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
        onPressed: () {
          print("pressed");
        },
      ),
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
          BottomNavigationBarItem(
            icon: Image.asset("images/birdhouse.png", scale: 1.4),
            activeIcon: Image.asset("images/birdhousefilled.png", scale: 1.4),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/search.png", scale: 1.4),
            activeIcon: Image.asset("images/searchfilled.png", scale: 1.4),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/bellring.png", scale: 1.4),
            activeIcon: Image.asset("images/bellringfilled.png", scale: 1.4),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/letter.png", scale: 1.4),
            activeIcon: Image.asset("images/letterfilled.png", scale: 1.4),
            title: Text(""),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxScrolled) => [
                SliverAppBar(
                  floating: true,
                  backgroundColor: Colors.white,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          radius: 17,
                          backgroundImage:
                              NetworkImage(selectedUser.userProfilePicture)),
                      Image.asset("images/twittericon.png", scale: 3),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "images/stars.png",
                          scale: 3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              body: RefreshIndicator(
                onRefresh: () => _refresh(),
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Container(
                    height: height * 0.012,
                    color: Color(0xFFC6CBCB),
                  ),
                  itemCount: widget.tweets.length,
                  itemBuilder: (context, index) => Tweet(
                    tweet: widget.tweets.reversed.toList()[index],
                    user: widget.tweets.reversed.toList()[index].userOfTweet(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _refresh() {
    setState(() {});
    print("hello");
    return Future.value(true);
  }
}
