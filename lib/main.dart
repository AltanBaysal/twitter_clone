import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter/user.dart';
import 'tweet.dart';

int _currentIndex = 0;

void create() {
  createUser("Mr.Stark", "@Mr.Stark", "123456",
      "https://instagram.fgzt3-1.fna.fbcdn.net/v/t51.2885-19/s150x150/130449922_891080031637366_92203762495301097_n.jpg?_nc_ht=instagram.fgzt3-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=OgJW-4GHYpkAX-pYAU4&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT9llbFvlpxR60uvz8xNvFd4YXNi7sbv3qShJytZFNX5qw&oe=61D5F679&_nc_sid=7bff83");
  createUser("User2", "@User_2", "123456",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnJAabyseF4kY9fWKg6dQeLRQgwl-Uaujhqg&usqp=CAU");
  createUser("User3", "@User3_3!", "654321",
      "https://forum.donanimarsivi.com/attachments/1600557477521-jpeg.58079/");

  selectUser("@Mr.Stark", "123456");
  selectedUser.createTweet("Bu bir tweettir");
  selectedUser.createTweet("Bu başka bir tweettir");
  selectedUser.createTweet("Bu Fotoğraflı bir tweettir",
      image:
          "http://static1.squarespace.com/static/5be156f4365f02418a904b89/5c6bd79f419202ebf60c713d/5c7ee6ed085229c0b8891384/1571346599322/mindset%2Bnot%2Ba%2Blocation.jpg?format=1500w");

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
  runApp(StatelessMainPage());
}

class StatelessMainPage extends StatelessWidget {
  const StatelessMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        color:  Colors.white,
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
                  itemCount: tweets.length,
                  itemBuilder: (context, index) =>
                      tweet(width, height, context, index),
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

  Widget tweet(double width, double height, context, index) {
    Tweet tweet = tweets.reversed.toList()[index];
    User userOfTweet = tweet.userOfTweet();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.02, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: width * 0.07,
                      backgroundImage:
                          NetworkImage(userOfTweet.userProfilePicture),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userOfTweet.username,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                              "${tweet.mailOfUser} · ${tweet.timeSinceSharing()}",
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xFF7B7B7B))),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: 18,
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: Color(0xFFB1B1B1),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                width * 0.05, height * 0.017, width * 0.05, 0),
            child: Text(
              tweet.text,
              style: TextStyle(fontSize: width * 0.04),
            ),
          ),
          Container(
            child: tweet.image != ""
                ? Container(
                    margin: EdgeInsets.only(top: height * 0.02),
                    child: Image.network(tweet.image),
                  )
                : null,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(width * 0.01, 0, 0, height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "images/speechbubble.png",
                        scale: 1.7,
                        color: Color(0xFF4E4E4E),
                      ),
                    ),
                    Text(
                      tweet.totalComments.toString(),
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              )),
                              context: context,
                              builder: (context) =>
                                  buildSheet(height, width, tweet));
                        },
                        icon: tweet.isPersonRetweet(selectedUser.userEmail)
                            ? Image.asset("images/retweetcolored.png",
                                scale: 1.7)
                            : Image.asset(
                                "images/retweet.png",
                                scale: 1.5,
                                color: Color(0xFF4E4E4E),
                              )),
                    Text(
                      tweet.totalRetweets.toString(),
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          tweet.like(selectedUser.userEmail);
                          setState(() {});
                        },
                        icon: tweet.isPersonLiked(selectedUser.userEmail)
                            ? Image.asset("images/likecolored.png", scale: 1.5)
                            : Image.asset(
                                "images/like.png",
                                scale: 1.7,
                                color: Color(0xFF4E4E4E),
                              )),
                    Text(
                      tweet.totalLike.toString(),
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "images/share.png",
                    scale: 1.7,
                    color: Color(0xFF4E4E4E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSheet(double height, double width, Tweet tweet) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, height * 0.03, 0, 0),
      child: tweet.isPersonRetweet(selectedUser.userEmail)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    tweet.retweet(selectedUser.userEmail);
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.08, vertical: height * 0.02),
                    child: Row(
                      children: [
                        Image.asset("images/retweet.png", scale: 1.4),
                        SizedBox(width: width * 0.05),
                        Text(
                          "Retweetlemeyi geri al",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    tweet.retweet(selectedUser.userEmail);
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.08, vertical: height * 0.02),
                    child: Row(
                      children: [
                        Image.asset(
                          "images/retweet.png",
                          scale: 1.4,
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          "Retweetle",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.08, vertical: height * 0.02),
                    child: Row(
                      children: [
                        Image.asset(
                          "images/pen.png",
                          scale: 1.4,
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          "Tweeti Alıntıla",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
