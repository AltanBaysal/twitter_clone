import 'package:twitter/extension.dart';
import 'package:twitter/tweet_model.dart';

List<User> users = [];
late User selectedUser;

selectUser(String userEmail,String password){
  User? user = users.firstUserOrnull(userEmail);

  if(user != null){
    selectedUser = user;
  }else{
    throw Exception("user not found");
  }
}

class User{
  String _username;
  String _userEmail;
  String _userProfilePicture;
  String _password;

  User(this._username,this._userEmail,this._password,this._userProfilePicture);

  String get username => _username;
  String get userEmail => _userEmail;
  String get userProfilePicture => _userProfilePicture;

  bool checkPassword(String password){
    if(this._password == password){
      return false;
    }else{
      return true;
    }
  }

  createTweet(String text,{String image = ""}){
    TweetModel newTweet = TweetModel(_userEmail, text, image);
    tweets.add(newTweet);
  }
}


