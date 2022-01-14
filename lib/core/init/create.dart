import 'package:twitter/core/init/create_conversations.dart';
import 'package:twitter/core/init/create_tweets.dart';
import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/core/init/follow_users.dart';


void create() {
  users = createUsers();
  selectUser(userEmail: "@Mr.Stark", password: "123456");
  
  for (var element in users) {
    element.changeUserbio(newbio: element.username+" bio");
  }

  tweets = createTweets();
  followUser();

  createConversations();
  sendMessage();
}