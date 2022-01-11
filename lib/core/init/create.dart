import 'package:twitter/models/user_model.dart';
import 'package:twitter/services/create_tweets.dart';
import 'package:twitter/services/create_users.dart';
import 'package:twitter/services/un_follow_users.dart';


void create() {
  users = createUsers();
  selectUser(userEmail: "@Mr.Stark", password: "123456");
  tweets = createTweets();
  followUser();
}