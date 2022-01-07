import 'package:flutter/material.dart';
import 'package:twitter/core/custom_widgets/retweet_buttom_sheet_button_part.dart';
import 'package:twitter/tweet_model.dart';
import 'package:twitter/user_model.dart';

class RetweetBottomSheet extends StatelessWidget {
  const RetweetBottomSheet({
    Key? key,
    required this.tweet,
    required this.selectedUser,
    required this.onChange,
  }) : super(key: key);

  final TweetModel tweet;
  final UserModel selectedUser;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: height * 0.03),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          if (tweet.isPersonRetweet(userEmail: selectedUser.userEmail)) retweetButtomSheetButtonPart(width: width, height: height, text: "Retweetlemeyi geri al",
            image: "images/retweet.svg", func: (){
              tweet.retweet(userEmail: selectedUser.userEmail);
              Navigator.of(context).pop();
              onChange();
            },),

          if (!tweet.isPersonRetweet(userEmail: selectedUser.userEmail)) ...[
             retweetButtomSheetButtonPart(width: width, height: height, text: "Retweetle", image: 
             "images/retweet.svg", func: (){
               tweet.retweet(userEmail: selectedUser.userEmail);
                Navigator.of(context).pop();
                onChange();
             }),

             retweetButtomSheetButtonPart(width: width, height: height, text: "Tweeti Alıntıla", 
             image: "images/pen.svg", func: (){}),
          ],
        
        ],
      ),
    );
  }
}

