import 'package:twitter/core/init/create_conversations.dart';
import 'package:twitter/core/init/create_topics.dart';
import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/core/init/follow_users.dart';
import 'package:twitter/services/login_services/select_user_func.dart';


void create() {
  users = createUsers();
  selectUser(userEmail: "@Mr.Stark", password: "123456");
  
  for (var element in users) {
    element.changeUserbio(newbio: element.username+" bio");
  }

  followUser();

  createConversations();
  createMessage();
  createTopics();
}