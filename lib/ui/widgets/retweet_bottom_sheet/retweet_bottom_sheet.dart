import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/constants/asset_constants.dart';
import 'package:twitter/controllers/tweets_state.dart';
import 'package:twitter/main.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/retweet_bottom_sheet/retweet_buttom_sheet_button.dart';

class RetweetBottomSheet extends StatelessWidget {
  const RetweetBottomSheet({
    Key? key,
    required this.tweet,
  }) : super(key: key);

  final TweetModel tweet;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(top: height * 0.03),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tweet.isPersonRetweet(userEmail: selectedUser.userEmail))
            RetweetButtomSheetButton(
              width: width,
              height: height,
              text: local.retweetBottomSheetUndoRetweet,
              image: IconsConstant.retweetBottomSheetRetweet,
              func: () {
                Provider.of<TweetsState>(context,listen: false).retweetToggleTweetsState(tweet: tweet);
              },
            ),

          if (!tweet.isPersonRetweet(userEmail: selectedUser.userEmail)) ...[
            RetweetButtomSheetButton(
              width: width,
              height: height,
              text: local.retweetBottomSheetRetweet,
              image: IconsConstant.retweetBottomSheetRetweet,
              func: () {
                Provider.of<TweetsState>(context,listen: false).retweetToggleTweetsState(tweet: tweet);
              },
            ),

            RetweetButtomSheetButton(
              width: width,
              height: height,
              text: local.retweetBottomSheetQuoteTweet,
              image: IconsConstant.retweetBottomsheetQuoteTweet,
              func: () {},
            ),
          ],
        ],
      ),
    );
  }
}
