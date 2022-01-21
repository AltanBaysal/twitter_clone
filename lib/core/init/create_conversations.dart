import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/conversation_model.dart';
import 'package:twitter/services/conversations_finder_by_id.dart';
import 'package:twitter/services/start_conversation.dart';
import 'package:twitter/services/user_finder_by_email.dart';


//? bunları constant a eklemeli miyim?

List<Conversation> allConversations = [];

void createConversations() {
  startConversation(user1Email: "@Mr.Stark", user2Email: "@User_2");
  startConversation(user1Email: "@Mr.Stark", user2Email: "@User3_3!");
}

void sendMessage() {
  conversationFinderbyId(
    id: userFinderByEmail(userEmail: "@Mr.Stark", list: users).conversations.first
  ).sendMessage("@Mr.Stark", "Hello User2");
  
  conversationFinderbyId(
    id: userFinderByEmail(userEmail: "@Mr.Stark", list: users)
        .conversations
        .first,
  ).sendMessage("@Mr.Stark", "What's up?");

  conversationFinderbyId(
    id: userFinderByEmail(userEmail: "@User_2", list: users)
        .conversations
        .first,
  ).sendMessage("@User_2", "What's up?");

  conversationFinderbyId(
    id: userFinderByEmail(userEmail: "@User3_3!", list: users)
        .conversations
        .first,
  ).sendMessage("@User3_3!", "Hello Mr.Stark");
}
