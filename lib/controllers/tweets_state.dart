import 'package:flutter/foundation.dart';
import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/models/user_model.dart';

class TweetsState with ChangeNotifier {
  final List<UserModel> _userList = [];

  final List<TweetModel> _tweets = [
    users[1].createTweet(text: "bu başka birine ait bir tweettir"),
    users[2].createTweet(text: "bu üçünçü kişiye ait bir tweettir"),
    users[1].createTweet(
      text: "bu başka birine ait fotoğraflı bir tweettir",
      image:
          "https://elsdilokullari.net/wp-content/uploads/2015/01/Silicon-Valley.jpg",
    ),
    users[2].createTweet(
        text: """bu üçünçü kişiye ait bir fotoğraflı tweettir New York !!!""",
        image: "https://static.dw.com/image/56412099_303.jpg"),
    selectedUser.createTweet(text: "Bu bir tweettir"),
    selectedUser.createTweet(text: "Bu başka bir tweettir"),
    selectedUser.createTweet(
      text: "Bu Fotoğraflı bir tweettir",
      image:
          "http://static1.squarespace.com/static/5be156f4365f02418a904b89/5c6bd79f419202ebf60c713d/5c7ee6ed085229c0b8891384/1571346599322/mindset%2Bnot%2Ba%2Blocation.jpg?format=1500w",
    ),
  ];

  List<TweetModel> get tweets => _tweets;

  void createUser(UserModel user) {
    _userList.add(user);
  }

  void likeToggleTweetsState({required TweetModel tweet}) {
    tweet.likeToggle(userEmail: selectedUser.userEmail);
    notifyListeners();
  }

  void retweetToggleTweetsState({required TweetModel tweet}) {
    tweet.retweetToggle(userEmail: selectedUser.userEmail);
    notifyListeners();
  }
}
