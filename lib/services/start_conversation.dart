import 'package:twitter/core/init/create_conversations.dart';
import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/conversation_model.dart';
import 'package:twitter/services/user_finder_by_email.dart';



void startConversation({required String user1Email,required String user2Email}){
  Conversation newConversation = Conversation([user1Email, user2Email]);
  allConversations.add(newConversation);

  userFinderByEmail(userEmail: user1Email, list: users)!.conversations.add(newConversation.conversationUniqueId);
  userFinderByEmail(userEmail: user2Email, list: users)!.conversations.add(newConversation.conversationUniqueId);
}