import 'package:collection/src/iterable_extensions.dart';
import 'package:twitter/assets/constatns.dart';
import 'package:twitter/core/init/create_conversations.dart';
import 'package:twitter/models/conversation_model.dart';


//? muhtemelen çok verimsiz bir yol
Conversation conversationFinderbyId({required String id}){
  Conversation? conversation = allConversations.firstWhereOrNull((element) => element.conversationUniqueId == id);  
  if (conversation == null) throw Exception(ErrorMessages.userNotFound);
  return conversation;
}