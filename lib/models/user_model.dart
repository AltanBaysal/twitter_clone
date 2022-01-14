import 'package:twitter/assets/constatns.dart';
import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/services/user_finder_by_email.dart';

late UserModel selectedUser; 

void selectUser({required String userEmail, required String password}) {
  //? bu mu doğru yoksa collection darttan ekleyip kullanmak mı?
  UserModel? user = userFinderByEmail(userEmail: userEmail, list: users);

  if (user == null) throw Exception(ErrorMessages.userNotFound);
  selectedUser = user;
}

class UserModel {
  final String _username;
  final String _userEmail;
  final String _userProfilePicture;
  late final DateTime _joinDate;
  String _userBio = "";


  final String _password;


  final List<String> _following = [];
  final List<String> _followers = [];

  final List<String> _conversations =[];
  

  UserModel(this._username, this._userEmail, this._password,this._userProfilePicture){
    _joinDate = DateTime.now();
  }

  
  String get username => _username;
  String get userEmail => _userEmail;
  String get userProfilePicture => _userProfilePicture;

  String get userBio => _userBio;

  List<String> get following => _following;
  List<String> get followers => _followers;
  List<String> get conversations => _conversations;

  String getJoinDateAsString(){
    EnglishTexts.month[_joinDate.month];
    return "${EnglishTexts.month[_joinDate.month]} ${_joinDate.year}";
  }
  
  void changeUserbio({required String newbio}){
    _userBio = newbio;
  }

  void followUserToggle({required String email}) {
    
    if (isPersonfollowed(email: email)) {
      following.remove(email);
      users
          .firstWhere((element) => element.userEmail == email)
          .followers
          .remove(_userEmail);
    } else {
      following.add(email);
      users
          .firstWhere((element) => element.userEmail == email)
          .followers
          .add(_userEmail);
    }
  }

  bool checkPassword({required String password}) {
    return _password == password;
  }

  TweetModel createTweet({required String text, String? image}) {
    if (image != null) return TweetModel.withImage(_userEmail, text, image);
    return TweetModel(_userEmail, text);
  }

  bool isPersonfollowed({required String email}) {
    return following.contains(email);
  }
}
