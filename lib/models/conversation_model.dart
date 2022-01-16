import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/message_model.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/services/user_finder_by_email.dart';

class Conversation {
  final List<String> _usersEmail;

  String _conversationUniqueId = "";

  final List<Message> allMessages = [];

  Conversation(this._usersEmail) {
    createUniqueId();
  }

  List<String> get usersEmail => _usersEmail;
  String get conversationUniqueId => _conversationUniqueId;

  List<String> usersEmailWithoutSelectedUser() {
    List<String> newUserEmail = _usersEmail;
    newUserEmail.remove(selectedUser.userEmail);
    return newUserEmail;
  }

  List<UserModel> usersOfConversation() {
    List<UserModel> usersOfConversation = [];
    for (var element in _usersEmail) {
      usersOfConversation
          .add(userFinderByEmail(userEmail: element, list: users)!);
    }

    return usersOfConversation;
  }

  void createUniqueId() {
    for (var element in _usersEmail) {
      _conversationUniqueId += element;
    }
    _conversationUniqueId += DateTime.now().toString();
  }

  void sendMessage(String emailWhoSent, String text) {
    allMessages.add(Message(text, emailWhoSent));
  }

  String elapsedTimeSinceSentLastMessage() {
    Duration elapsedTime =
        DateTime.now().difference(allMessages.last.sendingDate);
    if (elapsedTime.inDays >= 1) return "${elapsedTime.inDays} d";
    if (elapsedTime.inHours >= 1) return "${elapsedTime.inHours} h";
    if (elapsedTime.inMinutes >= 1) return "${elapsedTime.inMinutes} m";
    if (elapsedTime.inSeconds >= 1) return "${elapsedTime.inSeconds} s";
    return "";
  }
}
