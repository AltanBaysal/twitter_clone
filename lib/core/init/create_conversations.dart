import 'package:twitter/models/conversation_model.dart';
import 'package:twitter/services/conversations_finder_by_Id.dart';
import 'package:twitter/services/start_conversation.dart';
import 'package:twitter/services/user_finder_by_email.dart';


List<Conversation> allConversations = [];

void createConversations(){
  startConversation(user1Email: "@Mr.Stark", user2Email: "@User_2");
  startConversation(user1Email: "@Mr.Stark", user2Email: "@User3_3!");
}


void sendMessage(){
  conversationFinderbyId(id: userFinderByEmail2(mailOfUser: "@Mr.Stark").conversations.first).sendMessage("@Mr.Stark", "Hello User2");
  conversationFinderbyId(id: userFinderByEmail2(mailOfUser: "@Mr.Stark").conversations.first).sendMessage("@Mr.Stark", "What's up?");

  conversationFinderbyId(id: userFinderByEmail2(mailOfUser: "@User_2").conversations.first).sendMessage("@User_2", "What's up?");

  conversationFinderbyId(id: userFinderByEmail2(mailOfUser: "@User3_3!").conversations.first).sendMessage("@User3_3!", "Hello Mr.Stark");
}

