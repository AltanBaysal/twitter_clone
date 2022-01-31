import 'package:twitter/models/conversation_model.dart';

extension ConversationModelFinderExtension on List<ConversationModal>{
  ConversationModal findConversation({required String oppositeUserEmail}){
    return firstWhere((element) => element.oppositeUserEmail == oppositeUserEmail);
  }
}