import 'package:flutter/material.dart';
import 'package:twitter/screens/twitter_home_page.dart';
import 'package:twitter/services/create_tweets.dart';

import 'dart:math' as math;

Widget pagechooser({required int currentIndex}) {
  if (currentIndex == 0) return TwitterHomePage(tweets: tweets);
  return Center(
    child: Transform.rotate(
      angle: -math.pi / 4,
      child: const Text(
        "Coming Soon",
        style: TextStyle(
          fontSize: 50,
          color: Colors.red,
        ),
      ),
    ),
  );
}
