import 'package:flutter/material.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/ui/widgets/tweet/tweet_bottom_action_bar.dart';
import 'package:twitter/ui/widgets/tweet/tweet_head_part.dart';
import 'package:twitter/ui/widgets/tweet/tweet_image_part.dart';
import 'package:twitter/ui/widgets/tweet/tweet_text_part.dart';


class TweetWidget extends StatelessWidget { //+
  const TweetWidget({
    Key? key,
    required this.tweet,
  }) : super(key: key);
  
  final TweetModel tweet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        TweetHeadPart(tweet: tweet),
      
        TweetTextPart(text:tweet.text),

        if (tweet.image != null) TweetImagePart(image:tweet.image!),
        
        TweetBottomActionBar(tweet:tweet),
      ],
    );
  }
}
