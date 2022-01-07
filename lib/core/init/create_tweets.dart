import 'package:twitter/tweet_model.dart';
import 'package:twitter/user_model.dart';
import 'create_users.dart';

//
List<TweetModel> tweets =[];

List<TweetModel> createTweets(){
  return[
    users[1].createTweet(text: "bu başka birine ait bir tweettir"),
    users[2].createTweet(text:"bu üçünçü kişiye ait bir tweettir"),

    users[1].createTweet(text:"bu başka birine ait fotoğraflı bir tweettir",image:"https://storage.googleapis.com/nrpassets/uploads/articles/1561556167-google_main.jpg"),


    users[2].createTweet(text:"""bu üçünçü kişiye ait bir fotoğraflı tweettir 
New York !!!""",
      image:"https://trthaberstatic.cdn.wp.trt.com.tr/resimler/1530000/new-york-depophotos-1531803_2.jpg"),


    selectedUser.createTweet(text:"Bu bir tweettir"),
    selectedUser.createTweet(text:"Bu başka bir tweettir"),
    selectedUser.createTweet(text:"Bu Fotoğraflı bir tweettir",image:"http://static1.squarespace.com/static/5be156f4365f02418a904b89/5c6bd79f419202ebf60c713d/5c7ee6ed085229c0b8891384/1571346599322/mindset%2Bnot%2Ba%2Blocation.jpg?format=1500w"),

  ];
}