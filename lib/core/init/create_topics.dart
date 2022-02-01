import 'package:twitter/models/topic_model.dart';
import 'package:twitter/models/tweet_model.dart';

List<TopicModel> trends = [];

createTopics(){
  trends.add(TopicModel("#GlobalWarming", [TweetModel("_user1", ""),TweetModel("_user2", ""),TweetModel("_user3", ""),TweetModel("_user4", ""),TweetModel("_user5", ""),TweetModel("_user6", ""),TweetModel("_user1", ""),TweetModel("_user2", ""),TweetModel("_user3", ""),TweetModel("_user4", ""),TweetModel("_user5", ""),TweetModel("_user6", ""),TweetModel("_user1", ""),TweetModel("_user2", ""),TweetModel("_user3", ""),TweetModel("_user4", ""),TweetModel("_user5", ""),TweetModel("_user6", ""),]));
  trends.add(TopicModel("#SpaceX", [TweetModel("_user1", ""),TweetModel("_user2", ""),TweetModel("_user3", ""),TweetModel("_user4", ""),TweetModel("_user5", ""),TweetModel("_user6", ""),TweetModel("_user1", ""),TweetModel("_user2", ""),TweetModel("_user3", ""),TweetModel("_user4", ""),TweetModel("_user5", ""),TweetModel("_user6", ""),]));
  trends.add(TopicModel("#USA VS China", [TweetModel("_user1", ""),TweetModel("_user2", ""),TweetModel("_user3", ""),TweetModel("_user4", ""),TweetModel("_user5", ""),TweetModel("_user6", ""),]));
  trends.add(TopicModel("#NASA", [TweetModel("_user1", ""),TweetModel("_user2", ""),TweetModel("_user3", ""),TweetModel("_user4", ""),TweetModel("_user5", ""),TweetModel("_user6", ""),]));
  trends.add(TopicModel("#ComputerScience", [TweetModel("_user1", ""),TweetModel("_user2", ""),TweetModel("_user3", ""),TweetModel("_user4", ""),TweetModel("_user5", "")]));
}