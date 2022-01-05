import 'package:flutter/material.dart';
import 'package:twitter/core/custom_widgets/retweet_bottom_sheet.dart';
import 'package:twitter/tweet_model.dart';
import 'package:twitter/user.dart';

class Tweet extends StatefulWidget {
  const Tweet({Key? key, required this.tweet, required this.user})
      : super(key: key);
  final TweetModel tweet;
  final User user;

  @override
  State<Tweet> createState() => _TweetState();
}

class _TweetState extends State<Tweet> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
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
                        NetworkImage(widget.user.userProfilePicture),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.username,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                            "${widget.tweet.mailOfUser} · ${widget.tweet.timeSinceSharing()}",
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
            widget.tweet.text,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),
        if (widget.tweet.image != null)
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            child: Image.network(widget.tweet.image!),
          ),
        Container(
          padding: EdgeInsets.only(left: width * 0.01, bottom: height * 0.01),
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
                    widget.tweet.totalComments.toString(),
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
                          builder: (context) => RetweetBottomSheet(
                            tweet: widget.tweet,
                            selectedUser: widget.user,
                            onChange: () {
                              setState(() {});
                            },
                          ),
                        );
                      },
                      icon: widget.tweet.isPersonRetweet(widget.user.userEmail)
                          ? Image.asset("images/retweetcolored.png", scale: 1.7)
                          : Image.asset(
                              "images/retweet.png",
                              scale: 1.5,
                              color: Color(0xFF4E4E4E),
                            )),
                  Text(
                    widget.tweet.totalRetweets.toString(),
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
                        widget.tweet.like(widget.user.userEmail);
                        setState(() {});
                      },
                      icon: widget.tweet.isPersonLiked(widget.user.userEmail)
                          ? Image.asset("images/likecolored.png", scale: 1.5)
                          : Image.asset(
                              "images/like.png",
                              scale: 1.7,
                              color: Color(0xFF4E4E4E),
                            )),
                  Text(
                    widget.tweet.totalLike.toString(),
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
    );
  }
}
