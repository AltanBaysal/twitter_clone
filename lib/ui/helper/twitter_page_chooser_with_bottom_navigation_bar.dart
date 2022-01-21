import 'package:flutter/material.dart';
import 'package:twitter/ui/enums/page_state.dart';
import 'package:twitter/ui/helper/twitter_page_chooser.dart';


class TwitterPageChooserWithTwitterBottomNavigationBar extends StatelessWidget {
  const TwitterPageChooserWithTwitterBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);
  final int currentIndex;


  @override
  Widget build(BuildContext context) {
    return TwitterPageChooser(pageState: pageStateChooserWithTwitterBottomNavigationBar(currentIndex));
  }
}

PageState pageStateChooserWithTwitterBottomNavigationBar(int currentIndex){
  switch (currentIndex) {
    case 0: return PageState.homePageState;
    case 1: return PageState.searchPageState;
    case 2: return PageState.notificationsPageState;
    case 3: return PageState.messagesPageState; 

    default: return PageState.homePageState;
  }
}