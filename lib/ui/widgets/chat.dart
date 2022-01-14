import 'package:flutter/material.dart';
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
    UserModel otherUser = userFinderByEmail2(mailOfUser: widget.conversation.usersEmailWithoutSelectedUser().first);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onLongPress: () {},
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(user: otherUser, conversation: widget.conversation)),
        );
      },

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
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
                    

                    //? kelimelere dikkat etmeden kesme olayını yapmadım
                    text: TextSpan(
                      text: "${otherUser.username} ",
                      style: TextStyle(
                        color: Colors.black, fontSize: width * 0.045),
                      children: [
                        TextSpan(
                          text: otherUser.userEmail,
                          style: TextStyle(
                            color: const Color(0x9E585858),
                            fontSize: width * 0.034,
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
                      color: const Color(0x9E585858),
                      fontSize: width * 0.034,
                    ),
                    maxLines: 2,
                    
                  )
                ],
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(left: width * 0.02),
              child: Text(widget.conversation.elapsedTimeSinceSentLastMessage()),
            )
          ],
        ),
      ),
    );
  }
}


/*
 child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.01),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: width * 0.08,
                  backgroundImage: const NetworkImage(
                      "https://i.pinimg.com/originals/d9/56/9b/d9569bbed4393e2ceb1af7ba64fdf86a.jpg"),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User1",
                        style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("LastMessage", softWrap: true)
                    ],
                  ),
                ),
              ],
            ),
            
            Container(
              margin: EdgeInsets.only(left: width * 0.01),
              alignment: Alignment.topRight,
              child: const Text("1d"),
            ),
          ],
        ),
      ),
*/
