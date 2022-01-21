import 'package:twitter/core/init/create_conversations.dart';
import 'package:twitter/models/conversation_model.dart';


Conversation conversationFinderbyId({required String id}) {
  Conversation conversation = allConversations.firstWhere((element) => element.conversationUniqueId == id);
  return conversation;
}
