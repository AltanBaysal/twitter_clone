import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/services/month_chooser_by_int.dart';
import 'package:twitter/services/user_model_finder_extension.dart';

import '../main.dart';

class TweetModel {
  late String _tweetId;

  final String _userEmail;
  final String _text;
  String? _image;

  late DateTime _releaseTime;


  final List<String> _personEmailWhoRetweets = [];
  final List<String> _personEmailWhoLikes = [];
  final Map<String, String> _personAndComments = {};


  TweetModel(this._userEmail, this._text) {
    tweetModelStarterCommonFuncs();
  }

  TweetModel.withImage(this._userEmail, this._text, this._image) {
    tweetModelStarterCommonFuncs();
  }

  void tweetModelStarterCommonFuncs() {
    _releaseTime = DateTime.now();
    _tweetId = "$_userEmail  ${releaseTime.toString()}";
  }



  String get tweetId => _tweetId;

  String get userEmail => _userEmail;
  String get text => _text;
  String? get image => _image;

  DateTime get releaseTime => _releaseTime;

  int get totalRetweets => _personEmailWhoRetweets.length;
  int get totalLike => _personEmailWhoLikes.length;
  int get totalComments => _personAndComments.length;



  void likeToggle({required String userEmail}) {
    if (isPersonLiked(userEmail: userEmail)) {
      _personEmailWhoLikes.remove(userEmail);
    } else {
      _personEmailWhoLikes.add(userEmail);
    }
  }

  void retweetToggle({required String userEmail}) {
    if (isPersonRetweet(userEmail: userEmail)) {
      _personEmailWhoRetweets.remove(userEmail);
    } else {
      _personEmailWhoRetweets.add(userEmail);
    }
  }

  String timeSinceSharing() {
    Duration elapsedTimeD = DateTime.now().difference(_releaseTime);

    if (elapsedTimeD.inDays > 6) return "${_releaseTime.day} ${monthChooserByInt(numberOfMonth: _releaseTime.month - 1).substring(4)}";

    if (elapsedTimeD.inDays > 0) return "${elapsedTimeD.inDays} ${local.abbreviationOfDay}";

    if (elapsedTimeD.inHours > 0) return "${elapsedTimeD.inHours} ${local.abbreviationOfHour}";

    if (elapsedTimeD.inMinutes > 0) return "${elapsedTimeD.inMinutes.toString()} ${local.abbreviationOfMinutes}";

    if (elapsedTimeD.inSeconds > 0)return "${elapsedTimeD.inSeconds.toString()} ${local.abbreviationOfSeconds}";
    

    return "0 ${local.abbreviationOfSeconds}";
  }

  UserModel userOfTweet() {
    return  users.userModelFinderByEmail(userEmail: _userEmail);
  }

  bool isPersonLiked({required String userEmail}) {
    return _personEmailWhoLikes.contains(userEmail);
  }

  bool isPersonRetweet({required String userEmail}) {
    return _personEmailWhoRetweets.contains(userEmail);
  }
}
