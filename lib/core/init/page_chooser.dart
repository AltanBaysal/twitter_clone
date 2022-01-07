import 'package:flutter/material.dart';
import 'package:twitter/features/twitter_home_page.dart';

Widget pagechooser({required int currentIndex}){
  if(currentIndex == 0) return const TwitterHomePage();
  return Container();
}