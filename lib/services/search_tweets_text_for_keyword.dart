
import 'package:twitter/models/tweet_model.dart';

extension SearchTweetsTextForKeyword on List<TweetModel>{
  List<TweetModel> searchTweetsTextForKeyword(String keyWords){
    return where((element) => element.text.contains(keyWords)).toList();
  }
} 