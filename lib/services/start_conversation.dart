import 'package:twitter/core/init/create_conversations.dart';
import 'package:twitter/models/conversation_model.dart';
import 'package:twitter/services/user_finder_by_email.dart';



void startConversation({required String user1Email,required String user2Email}){
  Conversation newConversation = Conversation([user1Email, user2Email]);
  allConversations.add(newConversation);

  userFinderByEmail2(mailOfUser: user1Email).conversations.add(newConversation.conversationUniqueId);
  userFinderByEmail2(mailOfUser: user2Email).conversations.add(newConversation.conversationUniqueId);
}