import 'package:twitter/core/init/create_conversations.dart';
import 'package:twitter/models/conversation_model.dart';

//? muhtemelen çok verimsiz bir yol
Conversation conversationFinderbyId({required String id}) {
  Conversation? conversation = allConversations
      .firstWhere((element) => element.conversationUniqueId == id);
  return conversation;
}