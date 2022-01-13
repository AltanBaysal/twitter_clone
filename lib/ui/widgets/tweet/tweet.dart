import 'package:flutter/material.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/tweet/tweet_bottom_action_bar.dart';
import 'package:twitter/ui/widgets/tweet/tweet_head_part.dart';
import 'package:twitter/ui/widgets/tweet/tweet_image_part.dart';
import 'package:twitter/ui/widgets/tweet/tweet_text_part.dart';


class Tweet extends StatefulWidget {
  const Tweet({Key? key, required this.tweet, required this.user}): super(key: key);
  
  final TweetModel tweet;
  final UserModel user;

  @override
  State<Tweet> createState() => _TweetState();
}

class _TweetState extends State<Tweet> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TweetHeadPart(tweet: widget.tweet, user: widget.user),
      
        TweetTextPart(text: widget.tweet.text),

        if (widget.tweet.image != null) TweetImagePart(image: widget.tweet.image!),//? bu ünlemi koymak zorundamıyım
        
        TweetBottomActionBar(tweet: widget.tweet, user: widget.user),

      ],
    );
  }
}

