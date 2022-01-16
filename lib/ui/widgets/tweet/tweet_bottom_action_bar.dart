import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/constants/asset_constants.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/retweet_bottom_sheet/retweet_bottom_sheet.dart';

class TweetBottomActionBar extends StatefulWidget {
  const TweetBottomActionBar({
    Key? key,
    required this.tweet,
    required this.user,
  }) : super(key: key);

  final TweetModel tweet;
  final UserModel user;

  @override
  State<TweetBottomActionBar> createState() => _TweetBottomActionBarState();
}

class _TweetBottomActionBarState extends State<TweetBottomActionBar> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: width * 0.01, horizontal: height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TweetBottomActionBarButton(
              icon: IconsConstant.tweetComment,
              text: widget.tweet.totalComments.toString(),
              func: () {}),
          TweetBottomActionBarButtonWithActiveToggle(
            activeToggle:
                widget.tweet.isPersonRetweet(userEmail: widget.user.userEmail),
            activeIcon: IconsConstant.tweetRetweetcolored,
            icon: IconsConstant.tweetRetweet,
            text: widget.tweet.totalRetweets.toString(),
            func: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
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
          ),
          TweetBottomActionBarButtonWithActiveToggle(
              activeToggle:
                  widget.tweet.isPersonLiked(userEmail: widget.user.userEmail),
              activeIcon: IconsConstant.tweetLikeColored,
              icon: IconsConstant.tweetLike,
              text: widget.tweet.totalLike.toString(),
              func: () {
                widget.tweet.likeToggle(userEmail: widget.user.userEmail);
                setState(() {});
              }),
          TweetBottomActionBarButton(
              icon: IconsConstant.tweetShare, func: () {}),
        ],
      ),
    );
  }
}

class TweetBottomActionBarButtonWithActiveToggle extends StatelessWidget {
  const TweetBottomActionBarButtonWithActiveToggle({
    Key? key,
    required this.activeToggle,
    required this.activeIcon,
    required this.icon,
    required this.text,
    required this.func,
  }) : super(key: key);

  final bool activeToggle;
  final String activeIcon;
  final String icon;
  final String text;
  final Function
      func;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            func();
          },
          icon: SizedBox(
            height: width * 0.05,
            width: width * 0.05,
            child: activeToggle
                ? SvgPicture.asset(activeIcon, fit: BoxFit.cover)
                : SvgPicture.asset(
                    icon,
                    fit: BoxFit.cover,
                    color: const Color(0xFF4E4E4E),
                  ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF4E4E4E),
          ),
        ),
      ],
    );
  }
}

class TweetBottomActionBarButton extends StatelessWidget {
  const TweetBottomActionBarButton({
    Key? key,
    required this.icon,
    this.text,
    required this.func,
  }) : super(key: key);

  final String icon;
  final String? text;
  final Function
      func;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            func();
          },
          icon: SizedBox(
            height: width * 0.05,
            width: width * 0.05,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.cover,
              color: const Color(0xFF4E4E4E),
            ),
          ),
        ),
        if (text != null)
          Text(
            text!,
            style: const TextStyle(
              color: Color(0xFF4E4E4E),
            ),
          ),
      ],
    );
  }
}
