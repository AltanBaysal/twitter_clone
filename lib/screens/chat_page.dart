import 'package:flutter/material.dart';
import 'package:twitter/models/conversation_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/chat_page_widgets.dart/chat_page_appbar.dart';
import 'package:twitter/ui/widgets/chat_page_widgets.dart/chat_page_body.dart';
import 'package:twitter/ui/widgets/chat_page_widgets.dart/chat_page_bottom_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.user, required this.conversation})
      : super(key: key);

  final UserModel user;
  final Conversation conversation;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ChatPageAppbar(user: widget.user),

                ChatPageBody(
                    otherUser: widget.user, conversation: widget.conversation),
              ],
            ),
            ChatPageBottomBar(
              conversation: widget.conversation,
              onChange: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
