import 'package:flutter/material.dart';
import 'package:twitter/core/init/create_tweets.dart';
import 'package:twitter/screens/twitter_home_page.dart';
import 'package:twitter/screens/twitter_message_page.dart';
import 'package:twitter/ui/enums/page_state.dart';


//? bunu ayrı fonksiyon olarak yazmak mantıklı mı ?
//! Burayi extension ile yap
class TwitterPageChooser extends StatelessWidget {
   const TwitterPageChooser({
    Key? key,
    required this.pageState,
  }) : super(key: key);

  final PageState pageState;

  @override
  Widget build(BuildContext context) {
    switch(pageState){
      case PageState.homePageState : return HomePage(tweets: tweets);
      case PageState.searchPageState : return Container();
      case PageState.notificationsPageState : return Container();
      case PageState.messagesPageState : return const TwitterMessagePage();
    }
  }
}

