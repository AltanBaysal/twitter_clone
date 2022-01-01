import 'package:twitter/extension.dart';

import 'tweet.dart';

List<User> users =[];
late User selectedUser;

createUser(String username,String userEmail,String password,String userProfilePicture){
  User newUser = User(username, userEmail,password,userProfilePicture);
  users.add(newUser);
}

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
    Tweet newTweet = Tweet(_userEmail, text, image);
    tweets.add(newTweet);
  }
}


