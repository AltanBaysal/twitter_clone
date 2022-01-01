import 'package:twitter/extension.dart';
import 'package:twitter/user.dart';

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


List<Tweet> tweets = [];

class Tweet{
  late String _tweetId;

  String _mailOfUser;
  String _text;
  String _image;

  late DateTime _releaseTime;

  List<String> _personEmailWhoRetweets = [];
  List<String> _personEmailWhoLikes = [];
  Map<String,String> _personAndComments ={};

  Tweet(this._mailOfUser,this._text,this._image){
    _releaseTime = DateTime.now();
    _tweetId = _mailOfUser+" "+releaseTime.toString();
  }

  String get tweetId => _tweetId;

  String get mailOfUser => _mailOfUser;
  String get text => _text;
  String get image => _image;

  DateTime get releaseTime => _releaseTime;

  int get totalRetweets => _personEmailWhoRetweets.length;
  int get totalLike => _personEmailWhoLikes.length;
  int get totalComments => _personAndComments.length;

  void like(String userEmail){
    if(isPersonLiked(userEmail)){
      _personEmailWhoLikes.remove(userEmail);
    }else{
      _personEmailWhoLikes.add(userEmail);
    }
  }

  void retweet(String userEmail){
    if(isPersonRetweet(userEmail)){
      _personEmailWhoRetweets.remove(userEmail);
    }
    else{
      _personEmailWhoRetweets.add(userEmail);
    }
  }


  String timeSinceSharing(){
    Duration elapsedTimeD = DateTime.now().difference(_releaseTime);

    if(elapsedTimeD.inDays > 6){
      return  _releaseTime.day.toString()+" "+monthsName[_releaseTime.month -1];
    }

    if(elapsedTimeD.inDays>0) return elapsedTimeD.inDays.toString() + " gün";
    if(elapsedTimeD.inHours > 0) return elapsedTimeD.inHours.toString() + " sa";
    if(elapsedTimeD.inMinutes > 0) return elapsedTimeD.inMinutes.toString() +" dk";
    if(elapsedTimeD.inSeconds > 0) return elapsedTimeD.inSeconds.toString() + " sn";

    return "0 s";
  }

  User userOfTweet(){
    User? user = users.firstUserOrnull(_mailOfUser);
    if(user != null){
      return user;
    }else{
      throw Exception("user not found");
    }

  }


  bool isPersonLiked(String userEmail){
    if(_personEmailWhoLikes.contains(userEmail)){
      return true;
    }
    return false;
  }

  bool isPersonRetweet(String userEmail){
    if(_personEmailWhoRetweets.contains(userEmail)){
      return true;
    }
    return false;
  }
}
