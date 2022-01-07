import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/core/custom_widgets/retweet_bottom_sheet.dart';
import 'package:twitter/tweet_model.dart';
import 'package:twitter/user_model.dart';


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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left:width * 0.05, top: height * 0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: width * 0.07,
                    backgroundImage:NetworkImage(widget.user.userProfilePicture),
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(left: width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.username,
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: width*0.046),
                        ),
                        
                        Text("${widget.tweet.mailOfUser} · ${widget.tweet.timeSinceSharing()}",
                          style: TextStyle(fontSize: width*0.046, color: Color(0xFF7B7B7B))),
                      ],
                    ),
                  ),
                ],
              ),
              
              IconButton(
                onPressed: () {},
                iconSize: width*0.05,
                icon: const Icon(Icons.more_vert_rounded,color: Color(0xFFB1B1B1),),
              )
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(left:width * 0.05,top: height * 0.017,right: width * 0.05),
          child: Text(
            widget.tweet.text,
            style: TextStyle(fontSize: width * 0.04),
          ),
        ),
        
        if (widget.tweet.image != null)Container(
            margin: EdgeInsets.only(top: height * 0.02),
            child: Image.network(widget.tweet.image!),
          ),
        
        Container(

          padding: EdgeInsets.symmetric(vertical: width * 0.01, horizontal: height * 0.01),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  IconButton(
                    onPressed: () {},

                    icon: SizedBox(
                      height: width*0.05,
                      width: width*0.05,
                      child: SvgPicture.asset("images/speechbubble.svg",color: const Color(0xFF4E4E4E),fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Text(
                    widget.tweet.totalComments.toString(),
                    style: const TextStyle(color: Color(0xFF4E4E4E),),
                  ),
                ],
              ),
              
              Row(
                children: [
                  IconButton(
                    onPressed: () {
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

                    icon: SizedBox(
                      height: width*0.05,
                      width: width*0.05,

                      child: widget.tweet.isPersonRetweet(userEmail: widget.user.userEmail)
                      ? SvgPicture.asset("images/retweetcolored.svg",fit: BoxFit.cover)
                      : SvgPicture.asset("images/retweet.svg",color: const Color(0xFF4E4E4E),fit: BoxFit.cover),
                    ),
                  ),


                  Text(
                    widget.tweet.totalRetweets.toString(),
                    style: const TextStyle(color: Color(0xFF4E4E4E),),
                  ),

                ],
              ),

              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      widget.tweet.like(userEmail: widget.user.userEmail);
                      setState(() {});
                    },

                    icon: SizedBox(
                      height: width*0.05,
                      width: width*0.05,

                      child: widget.tweet.isPersonLiked(userEmail:widget.user.userEmail)
                      ? SvgPicture.asset("images/likecolored.svg", fit: BoxFit.cover)
                      : SvgPicture.asset("images/like.svg",fit: BoxFit.cover,color: const Color(0xFF4E4E4E),),
                    )
                  ),

                  Text(
                    widget.tweet.totalLike.toString(),
                    style: const TextStyle(color: Color(0xFF4E4E4E),),
                  ),
                ],
              ),
              
              IconButton(
                onPressed: () {},
                icon: SizedBox(
                  height: width*0.05,
                  width: width*0.05,
                  child: SvgPicture.asset("images/share.svg",fit: BoxFit.cover,color: const Color(0xFF4E4E4E),),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

