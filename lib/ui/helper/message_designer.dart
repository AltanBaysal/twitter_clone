import 'package:flutter/material.dart';
import 'package:twitter/models/message_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/chat_page_widgets.dart/message.dart';


//! buna geri dön ve düzenle
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
    
    if(nextMessage != null && message.sendingDateAsString() == nextMessage!.sendingDateAsString() &&nextMessage!.senderEmail == message.senderEmail){
      addTimeToggle = false;
    }

    if (message.senderEmail == selectedUser.userEmail) {
      return MessageYouSent(message: message, addTimeToggle: addTimeToggle);  
    } 
    else {
      return MessageOppenentSent(message: message, addTimeToggle: addTimeToggle);
    }
  }
}
