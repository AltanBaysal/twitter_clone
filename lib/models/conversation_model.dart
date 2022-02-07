import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/main.dart';
import 'package:twitter/models/message_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/services/conversations_model_finder_extension.dart';
import 'package:twitter/services/localization_service.dart';
import 'package:twitter/services/user_model_finder_extension.dart';

class ConversationModal {
  final String _ownerUserEmail;
  final String _oppositeUserEmail;

  final List<Message> _allMessages = [];

  ConversationModal(this._ownerUserEmail, this._oppositeUserEmail);

  String get ownerUserEmail => _ownerUserEmail;
  String get oppositeUserEmail => _oppositeUserEmail;
  List<Message> get allMessages => _allMessages;

  UserModel get ownerUser =>
      users.userModelFinderByEmail(userEmail: _ownerUserEmail);
  UserModel get oppositeUser =>
      users.userModelFinderByEmail(userEmail: _oppositeUserEmail);

  void allMessagesAddMessage({required Message message}) {
    _allMessages.add(message);
  }

  void sendMessage(String text) {
    Message newMessage = Message(text, _oppositeUserEmail, _ownerUserEmail);
    _allMessages.add(newMessage);
    oppositeUser.conversations
        .findConversation(oppositeUserEmail: _ownerUserEmail)
        .allMessagesAddMessage(message: newMessage);
  }

  String elapsedTimeSinceSentLastMessage() {
    Duration elapsedTime =
        DateTime.now().difference(_allMessages.last.sendingDate);
    if (elapsedTime.inDays >= 1)
      return "${elapsedTime.inDays} ${LocalizationService.of().getLocale.abbreviationOfDay}";
    if (elapsedTime.inHours >= 1)
      return "${elapsedTime.inHours} ${LocalizationService.of().getLocale.abbreviationOfHour}";
    if (elapsedTime.inMinutes >= 1)
      return "${elapsedTime.inMinutes} ${LocalizationService.of().getLocale.abbreviationOfMinutes}";
    if (elapsedTime.inSeconds >= 1)
      return "${elapsedTime.inSeconds} ${LocalizationService.of().getLocale.abbreviationOfSeconds}";
    return "";
  }
}
