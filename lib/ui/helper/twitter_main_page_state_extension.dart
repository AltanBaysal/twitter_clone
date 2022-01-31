import 'package:flutter/material.dart';
import 'package:twitter/core/init/create_tweets.dart';
import 'package:twitter/screens/twitter_home_page.dart';
import 'package:twitter/screens/twitter_message_page.dart';
import 'package:twitter/ui/enums/page_state.dart';

extension PageStateExtensionsAboutWidget on TwitterMainPageState{
  Widget twitterMainPageChooser(){
    switch(this){
      case TwitterMainPageState.homePageState : return HomePage(tweets: tweets);
      case TwitterMainPageState.searchPageState : return Container();
      case TwitterMainPageState.notificationsPageState : return Container();
      case TwitterMainPageState.messagesPageState : return const TwitterMessagePage();
    }
  }
} 

