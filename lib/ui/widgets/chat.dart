import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/conversation_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/screens/chat_page.dart';
import 'package:twitter/services/user_finder_by_email.dart';


class Chat extends StatefulWidget {
  const Chat({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  final Conversation conversation;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    UserModel otherUser = userFinderByEmail(userEmail: widget.conversation.usersEmailWithoutSelectedUser().first,list: users);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onLongPress: () {},
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChatPage(user: otherUser, conversation: widget.conversation)),
        );
      },
      child: Container(
        
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: width * 0.08,
                backgroundImage: NetworkImage(otherUser.userProfilePicture),
              ),
            ),

            SizedBox(
              width: width * 0.65,
              height: height * 0.08,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    text: TextSpan(
                      text: "${otherUser.username} ",
                      style: TextStyle(
                          color: Colors.black, fontSize: width * 0.045),
                      children: [
                        TextSpan(
                          text: otherUser.userEmail,
                          style: TextStyle(
                            color: ColorsConstant.lightBlack,
                            fontSize: width * 0.045,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.conversation.allMessages.isNotEmpty
                        ? widget.conversation.allMessages.last.text
                        : "",
                    softWrap: true,
                    style: TextStyle(
                      color: ColorsConstant.lightBlack,
                      fontSize: width * 0.045,
                    ),
                    maxLines: 2,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.02),
              child:
                  Text(widget.conversation.elapsedTimeSinceSentLastMessage()),
            )
          ],
        ),
      ),
    );
  }
}
