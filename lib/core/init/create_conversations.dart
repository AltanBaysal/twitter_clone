import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/services/conversations_model_finder_extension.dart';
import 'package:twitter/services/user_model_finder_extension.dart';

void createConversations() {
  selectedUser.startConversation(oppositeUserEmail: "@User_2");
  selectedUser.startConversation(oppositeUserEmail: "@User3_3!");
}

void createMessage() {
  selectedUser.conversations
      .findConversation(oppositeUserEmail: "@User_2")
      .sendMessage("Hello User2");

  selectedUser.conversations
      .findConversation(oppositeUserEmail: "@User_2")
      .sendMessage("What's up?");

  users.userModelFinderByEmail(userEmail:"@User3_3!").conversations
      .findConversation(oppositeUserEmail: "@Mr.Stark")
      .sendMessage("Hello Mr.Stark");
}
