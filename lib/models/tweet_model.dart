import 'package:twitter/models/user_model.dart';
import 'package:twitter/services/create_users.dart';
import 'package:twitter/services/extension.dart';

List monthsName = [
  "Oca",
  "Şub",
  "Mar",
  "Nis",
  "May",
  "Haz",
  "Tem",
  "Ağu",
  "Eyl",
  "Eki",
  "Kas",
  "Ara",
];

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
    _tweetId = _mailOfUser + " " + releaseTime.toString();
  }

  String get tweetId => _tweetId;

  String get mailOfUser => _mailOfUser;
  String get text => _text;
  String? get image => _image;

  DateTime get releaseTime => _releaseTime;

  int get totalRetweets => _personEmailWhoRetweets.length;
  int get totalLike => _personEmailWhoLikes.length;
  int get totalComments => _personAndComments.length;

  void like({required String userEmail}) {
    if (isPersonLiked(userEmail: userEmail)) {
      _personEmailWhoLikes.remove(userEmail);
    } else {
      _personEmailWhoLikes.add(userEmail);
    }
  }

  void retweet({required String userEmail}) {
    if (isPersonRetweet(userEmail: userEmail)) {
      _personEmailWhoRetweets.remove(userEmail);
    } else {
      _personEmailWhoRetweets.add(userEmail);
    }
  }

  String timeSinceSharing() {
    Duration elapsedTimeD = DateTime.now().difference(_releaseTime);

    if (elapsedTimeD.inDays > 6)
      return _releaseTime.day.toString() +
          " " +
          monthsName[_releaseTime.month - 1];
    if (elapsedTimeD.inDays > 0) return elapsedTimeD.inDays.toString() + " gün";
    if (elapsedTimeD.inHours > 0)
      return elapsedTimeD.inHours.toString() + " sa";
    if (elapsedTimeD.inMinutes > 0)
      return elapsedTimeD.inMinutes.toString() + " dk";
    if (elapsedTimeD.inSeconds > 0)
      return elapsedTimeD.inSeconds.toString() + " sn";

    return "0 s";
  }

  UserModel userOfTweet() {
    UserModel? user = users.firstUserOrnull(email: _mailOfUser);

    if (user == null) throw Exception("user not found");
    return user;
  }

  bool isPersonLiked({required String userEmail}) {
    return _personEmailWhoLikes.contains(userEmail);
  }

  bool isPersonRetweet({required String userEmail}) {
    return _personEmailWhoRetweets.contains(userEmail);
  }
}
