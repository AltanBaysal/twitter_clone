import 'package:flutter/material.dart';
import 'package:twitter/tweet_model.dart';
import 'package:twitter/user.dart';

class RetweetBottomSheet extends StatelessWidget {
  const RetweetBottomSheet({
    Key? key,
    required this.tweet,
    required this.selectedUser,
    required this.onChange,
  }) : super(key: key);
  final TweetModel tweet;
  final User selectedUser;
  final VoidCallback onChange;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
                    onChange();
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
                    onChange();
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
