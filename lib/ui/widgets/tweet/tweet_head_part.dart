import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/models/user_model.dart';

class TweetHeadPart extends StatelessWidget {
  const TweetHeadPart({
    Key? key,
    required this.tweet,
  }) : super(key: key);

  final TweetModel tweet;

  @override
  Widget build(BuildContext context) {
    final UserModel user = tweet.userOfTweet();

    double height = MediaQuery.of(context)
        .size
        .height; //? bunları sürekli kullanmak mantıklı mı?
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: width * 0.05, top: height * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: width * 0.07,
                backgroundImage: NetworkImage(user.userProfilePicture),
              ),
              
              Container(
                margin: EdgeInsets.only(left: width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.username,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.046),
                    ),
                    Text(
                      "${tweet.userEmail} · ${tweet.timeSinceSharing()}",
                      style: TextStyle(
                          fontSize: width * 0.046, color: ColorsConstant.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),

          IconButton(
            onPressed: () {},
            iconSize: width * 0.05,
            icon: const Icon(
              Icons.more_vert_rounded,
              color: ColorsConstant.lightBlack,
            ),
          )
        ],
      ),
    );
  }
}
