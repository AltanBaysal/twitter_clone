import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/conversation_model.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/services/conversations_model_finder_extension.dart';
import 'package:twitter/services/month_chooser_by_int.dart';
import 'package:twitter/services/user_model_finder_extension.dart';

late UserModel selectedUser;  //global değerleri GlobalVar adında bir class oluşturup içine koymalımıyım

class UserModel {
  final String _username;
  final String _userEmail;
  final String _userProfilePicture;
  late final DateTime _joinDate;
  String _userBio = "";


  final String _password;


  final List<String> _following = [];
  final List<String> _followers = [];

  final List<ConversationModal> _conversations =[

  ];
  
  UserModel(this._username, this._userEmail, this._password,this._userProfilePicture){
    _joinDate = DateTime.now();
  }

  
  String get username => _username;
  String get userEmail => _userEmail;
  String get userProfilePicture => _userProfilePicture;

  String get userBio => _userBio;

  List<String> get following => _following;
  List<String> get followers => _followers;
  List<ConversationModal> get conversations => _conversations;

  
  

  String getJoinDateAsString(){
    monthChooserByInt(numberOfMonth: _joinDate.month);
    return "${monthChooserByInt(numberOfMonth: _joinDate.month)} ${_joinDate.year}";
  }
  
  bool checkPassword({required String password}) {
    return _password == password;
  }

  bool isPersonfollowed({required String email}) {
    return following.contains(email);
  }

  
  void deleteConversation({required String oppositeUserEmail}){
    _conversations.remove(_conversations.findConversation(oppositeUserEmail: oppositeUserEmail));
  }

  void startConversation({required String oppositeUserEmail}){
    _conversations.add(ConversationModal(_userEmail, oppositeUserEmail));
    users.userModelFinderByEmail(userEmail: oppositeUserEmail).conversations.add(ConversationModal(oppositeUserEmail,_userEmail));
  }

  TweetModel createTweet({required String text, String? image}) {
    if (image != null) return TweetModel.withImage(_userEmail, text, image);
    return TweetModel(_userEmail, text);
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

}
