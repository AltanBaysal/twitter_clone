import 'package:flutter/material.dart';
import 'package:twitter/models/message_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/chat_page_widgets.dart/message.dart';

class MessageDesigner extends StatelessWidget {
  const MessageDesigner({
    Key? key,
    required this.message,
    this.nextMessage,
  }) : super(key: key);

  final Message message;
  final Message? nextMessage;

  @override
  Widget build(BuildContext context) {
    bool addTimeToggle = true;

    if (message.emailWhoSent == selectedUser.userEmail) {
      if (nextMessage == null) {
      } 
      else if (message.sendingDateAsString() == nextMessage!.sendingDateAsString() && nextMessage!.emailWhoSent == message.emailWhoSent) {
        addTimeToggle = false;
      }


      return MessageYouSent(message: message, addTimeToggle: addTimeToggle);
    } 

    else {
      if (nextMessage == null) {} 
      else if (message.sendingDateAsString() == nextMessage!.sendingDateAsString() && nextMessage!.emailWhoSent == message.emailWhoSent) {
        addTimeToggle = false;
      }

      return MessageOppenentSent(message: message, addTimeToggle: addTimeToggle);
    }
  }
}
