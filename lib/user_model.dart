import 'package:twitter/extension.dart';
import 'package:twitter/tweet_model.dart';
import 'core/init/create_users.dart';


late UserModel selectedUser; //yok edilmesi lazım

selectUser({required String userEmail,required String password}){
  UserModel? user = users.firstUserOrnull(email:userEmail);

  if(user == null)throw Exception("user not found");
  selectedUser = user;
}

class UserModel{
  final String _username;
  final String _userEmail;
  final String _userProfilePicture;
  final String _password;

  List<String>  _following =[];
  List<String>  _followers =[];


  UserModel(this._username,this._userEmail,this._password,this._userProfilePicture);

  String get username => _username;
  String get userEmail => _userEmail;
  String get userProfilePicture => _userProfilePicture;

  List<String> get following => _following;
  List<String> get followers => _followers;


  void followOrUnfollow({required String email}){
    if(isPersonfollowed(email:email)){
      following.remove(email);
      users.firstWhere((element) => element.userEmail == email).followers.remove(_userEmail);
    }else{
      following.add(email);
      users.firstWhere((element) => element.userEmail == email).followers.add(_userEmail);
    }
  }


  bool checkPassword({required String password}){
    return _password == password;
  }

  TweetModel createTweet({required String text,String? image}){
    if(image != null) return TweetModel.withImage(_userEmail, text, image);
    return TweetModel(_userEmail, text);
  }

  bool isPersonfollowed({required String email}){
    return following.contains(email);
  }
}

