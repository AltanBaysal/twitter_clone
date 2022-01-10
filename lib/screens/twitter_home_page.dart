import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/tweet.dart';

class TwitterHomePage extends StatefulWidget {
  const TwitterHomePage({
    Key? key,
    required this.tweets,
  }) : super(key: key);

  final List<TweetModel> tweets;

  @override
  _TwitterMainPageState createState() => _TwitterMainPageState();
}

class _TwitterMainPageState extends State<TwitterHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxScrolled) => [
        SliverAppBar(
          automaticallyImplyLeading: false,
          floating: true,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: CircleAvatar(
                  radius: width * 0.04,
                  backgroundImage:
                      NetworkImage(selectedUser.userProfilePicture),
                ),
              ),

              GestureDetector(
                onTap: () {},
                child: SizedBox(
                    height: height * 0.031,
                    width: height * 0.031,
                    child: SvgPicture.asset("assets/images/twittericon.svg",
                        fit: BoxFit.cover)),
              ),
              //basıldığında listenin yukarı çıkması eklenecek
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: height * 0.031,
                  width: height * 0.031,
                  child: SvgPicture.asset(
                    "assets/images/stars.svg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //yakında eklenecek
            ],
          ),
        ),
      ],
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Container(
            height: height * 0.012,
            color: const Color(0xFFC6CBCB),
          ),
          itemCount: widget.tweets.length,
          itemBuilder: (context, index) => Tweet(
            tweet: widget.tweets.reversed.toList()[index],
            user: widget.tweets.reversed.toList()[index].userOfTweet(),
          ),
        ),
      ),
    );
  }

  _refresh() {
    setState(() {});
    return Future.value(true);
  }
}
