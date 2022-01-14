import 'package:twitter/assets/constatns.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/services/user_finder_by_email.dart';

class TweetModel {
  late String _tweetId;

  final String _mailOfUser;
  final String _text;
  String? _image;

  late DateTime _releaseTime;


  final List<String> _personEmailWhoRetweets = [];
  final List<String> _personEmailWhoLikes = [];
  final Map<String, String> _personAndComments = {};


  TweetModel(this._mailOfUser, this._text) {
    tweetModelStarterCommonFuncs();
  }

  TweetModel.withImage(this._mailOfUser, this._text, this._image) {
    tweetModelStarterCommonFuncs();
  }

  void tweetModelStarterCommonFuncs() {
    _releaseTime = DateTime.now();
    _tweetId = "$_mailOfUser  ${releaseTime.toString()}";
  }

  String get tweetId => _tweetId;

  String get mailOfUser => _mailOfUser;
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

    if (elapsedTimeD.inDays > 6) return "${_releaseTime.day} ${TurkishTexts.turkishMonths[_releaseTime.month - 1].substring(4)}";//!

    if (elapsedTimeD.inDays > 0) return "${elapsedTimeD.inDays} ${TurkishTexts.day}";

    if (elapsedTimeD.inHours > 0) return "${elapsedTimeD.inHours} ${TurkishTexts.abbreviationOfHour}";

    if (elapsedTimeD.inMinutes > 0) return "${elapsedTimeD.inMinutes.toString()} ${TurkishTexts.abbreviationOfMinutes}";

    if (elapsedTimeD.inSeconds > 0)return "${elapsedTimeD.inSeconds.toString()} ${TurkishTexts.abbreviationOfSeconds}";
    

    return "0 ${TurkishTexts.abbreviationOfSeconds}";
  }

  UserModel userOfTweet() {
    return userFinderByEmail2(mailOfUser: _mailOfUser);
  }

  bool isPersonLiked({required String userEmail}) {
    return _personEmailWhoLikes.contains(userEmail);
  }

  bool isPersonRetweet({required String userEmail}) {
    return _personEmailWhoRetweets.contains(userEmail);
  }
}
