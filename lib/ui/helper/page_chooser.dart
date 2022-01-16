import 'package:flutter/material.dart';
import 'package:twitter/constants/english_constants.dart';
import 'package:twitter/core/init/create_tweets.dart';
import 'package:twitter/screens/twitter_home_page.dart';
import 'dart:math' as math;

import 'package:twitter/screens/twitter_message_page.dart';

//? bunun yeri doğru mu çünkü bu bir widget
class PageChooser extends StatelessWidget {
  const PageChooser({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) return HomePage(tweets: tweets);
    if (currentIndex == 3) return const MessagePage();

    return Center(
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: const Text(
          EnglishTexts.comingSoon,
          style: TextStyle(
            fontSize: 50,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
