import 'package:twitter/models/tweet_model.dart';


class TopicModel{
  final String _hashtag;

  final List<TweetModel> _tweetsContainHashtag;

  TopicModel(this._hashtag,this._tweetsContainHashtag);

  String get hashtag => _hashtag;
  List<TweetModel> get tweetsContainHashtag => _tweetsContainHashtag;

  int get countOfTweetsContainHashtag => _tweetsContainHashtag.length;
}