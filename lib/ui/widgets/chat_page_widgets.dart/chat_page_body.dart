import 'package:flutter/material.dart';
import 'package:twitter/models/conversation_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/helper/message_designer.dart';

class ChatPageBody extends StatelessWidget {
  const ChatPageBody({
    Key? key,
    required this.otherUser,
    required this.conversation,
  }) : super(key: key);

  final UserModel otherUser;
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return ListView(
      shrinkWrap: true,
      children: [
      Container(
        margin: EdgeInsets.only(top: height * 0.015, bottom: height * 0.03),
        child: Column(
          children: [
            RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              text: TextSpan(
                text: "${otherUser.username} ",
                style:
                    TextStyle(color: Colors.black, fontSize: width * 0.045),
                children: [
                  TextSpan(
                    text: otherUser.userEmail,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: width * 0.034,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              otherUser.userBio,
              style:
                  TextStyle(fontSize: width * 0.034, color: Colors.black),
            ),
            RichText(
              text: TextSpan(
                text: otherUser.following.length.toString(),
                style:
                    TextStyle(color: Colors.black, fontSize: width * 0.04),
                children: [
                  TextSpan(
                    text: " Following ",
                    style: TextStyle(
                        color: const Color(0xFF7B7B7B),
                        fontSize: width * 0.04),
                  ),
                  TextSpan(
                    text: otherUser.followers.length.toString(),
                    style: TextStyle(
                        color: Colors.black, fontSize: width * 0.04),
                  ),
                  TextSpan(
                    text: " Followers ",
                    style: TextStyle(
                        color: const Color(0xFF7B7B7B),
                        fontSize: width * 0.04),
                  ),
                ],
              ),
            ),
            Text("Joined ${otherUser.getJoinDateAsString()}"),
          ],
        ),
      ),
      
      ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: conversation.allMessages.length,
        itemBuilder: (context, index) {
          if (index >= conversation.allMessages.length - 1)return MessageDesigner(message: conversation.allMessages[index]);
          return MessageDesigner(
              message: conversation.allMessages[index],
              nextMessage: conversation.allMessages[index + 1]);
        },
      ),
    ]);
  }
}
