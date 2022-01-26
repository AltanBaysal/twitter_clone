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
    return TwitterPageChooser(pageState: PageState.values[currentIndex]);
  }
}