import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:twitter/constants/asset_constants.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/controllers/tweets_state.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/retweet_bottom_sheet/retweet_bottom_sheet.dart';


class TweetBottomActionBar extends StatefulWidget {
  const TweetBottomActionBar({
    Key? key,
    required this.tweet,
  }) : super(key: key);

  final TweetModel tweet;

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
            func: () {},
          ),

          TweetBottomActionBarButtonWithToggleActiveState(
            toggleActiveState: widget.tweet.isPersonRetweet(userEmail: selectedUser.userEmail),
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
                ),
              );
            },
          ),

          Consumer<TweetsState>(
            builder: (_, value, child) => TweetBottomActionBarButtonWithToggleActiveState(
              toggleActiveState:widget.tweet.isPersonLiked(userEmail: selectedUser.userEmail),
              activeIcon: IconsConstant.tweetLikeColored,
              icon: IconsConstant.tweetLike,
              text: widget.tweet.totalLike.toString(),
              func: () {
                value.likeToggleTweetsState(tweet: widget.tweet);
              },
            ),
          ),

          TweetBottomActionBarButton(icon: IconsConstant.tweetShare, func: () {}),
        ],
      ),
    );
  }
}


class TweetBottomActionBarButtonWithToggleActiveState extends StatelessWidget {
  const TweetBottomActionBarButtonWithToggleActiveState({
    Key? key,
    required this.toggleActiveState,
    required this.activeIcon,
    required this.icon,
    required this.text,
    required this.func,
  }) : super(key: key);

  final bool toggleActiveState;
  final String activeIcon;
  final String icon;
  final String text;
  final Function func;

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
            child: toggleActiveState
                ? SvgPicture.asset(activeIcon, fit: BoxFit.cover)
                : SvgPicture.asset(
                    icon,
                    fit: BoxFit.cover,
                    color: ColorsConstant.lightBlack,
                  ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: ColorsConstant.lightBlack,
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
  final Function func;

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
              color: ColorsConstant.lightBlack,
            ),
          ),
        ),
        if (text != null)
          Text(
            text!,
            style: const TextStyle(
              color: ColorsConstant.lightBlack,
            ),
          ),
      ],
    );
  }
}
