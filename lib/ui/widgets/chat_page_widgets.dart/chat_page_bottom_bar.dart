import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/assets/constatns.dart';
import 'package:twitter/models/conversation_model.dart';
import 'package:twitter/models/user_model.dart';

//? bunu buraya mı yoksa screende chatpage diye dosya oluşturup oraya mı koymalıyım

class ChatPageBottomBar extends StatefulWidget {
  const ChatPageBottomBar({
    Key? key,
    required this.conversation,
    required this.onChange,
  }) : super(key: key);

  final Conversation conversation;
  final VoidCallback onChange;

  @override
  State<ChatPageBottomBar> createState() => _ChatPageBottomBarState();
}

class _ChatPageBottomBarState extends State<ChatPageBottomBar> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 0.5, color: Colors.grey)),
      ),
      height: height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: width * 0.06,
              width: width * 0.06,
              child: SvgPicture.asset(
                IconsConstant.chatPageAppbarButtonImage,
                fit: BoxFit.cover,
                color: Colors.blue,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: width * 0.06,
              width: width * 0.06,
              child: SvgPicture.asset(
                IconsConstant.chatPageAppbarButtonGif,
                fit: BoxFit.cover,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.55,
            height: width * 0.06,
            child: TextField(
              textInputAction: TextInputAction.send,
              onSubmitted: (value) {
                widget.conversation.sendMessage(selectedUser.userEmail, textController.text);
                textController.clear();
                widget.onChange();
              },
              onChanged: (text) {
                setState(() {});
              },
              controller: textController,
              decoration: InputDecoration(
                hintText: "Start a message",
                hintStyle: TextStyle(fontSize: width * 0.035),
              ),
            ),
          ),
          Container(
            height: width * 0.08,
            width: 0.5,
            color: Colors.black,
          ),
          if (textController.text.isEmpty)
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                  height: width * 0.08,
                  width: width * 0.08,
                  child: SvgPicture.asset(
                      IconsConstant.chatPageAppbarButtonSoundVoice,
                      fit: BoxFit.cover)),
            )
          else
            GestureDetector(
              onTap: () {
                widget.conversation
                    .sendMessage(selectedUser.userEmail, textController.text);
                textController.clear();
                widget.onChange();
              },
              child: SizedBox(
                height: width * 0.06,
                width: width * 0.06,
                child: SvgPicture.asset(
                  IconsConstant.chatPageAppbarButtonSend,
                  fit: BoxFit.cover,
                  color: Colors.blue,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
