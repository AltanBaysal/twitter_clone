import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/core/init/create_tweets.dart';
import 'package:twitter/core/init/tweet.dart';
import 'package:twitter/user_model.dart';
//+

class TwitterHomePage extends StatefulWidget {
  const TwitterHomePage({Key? key}) : super(key: key);

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
                onTap: (){
                  Scaffold.of(context).openDrawer();
                },
                child: CircleAvatar(
                  radius: width*0.04,
                  backgroundImage: NetworkImage(selectedUser.userProfilePicture),
                ),
              ),

              GestureDetector(
                onTap: (){},
                child: SizedBox(
                  height: height*0.031  ,
                  width: height*0.031,
                  child: SvgPicture.asset("images/twittericon.svg", fit:BoxFit.cover)
                ),
              ),
              //basıldığında listenin yukarı çıkması eklenecek
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: height*0.031  ,
                  width: height*0.031,
                  child: SvgPicture.asset(
                    "images/stars.svg",
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

          itemCount: tweets.length,
          itemBuilder: (context, index) => Tweet(
            tweet: tweets.reversed.toList()[index],
            user: tweets.reversed.toList()[index].userOfTweet(),
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
