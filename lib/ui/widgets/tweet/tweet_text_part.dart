import 'package:flutter/material.dart';


class TweetTextPart extends StatelessWidget {
  const TweetTextPart({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          left: width * 0.05, top: height * 0.017, right: width * 0.05),
      child: Text(
        text,
        style: TextStyle(fontSize: width * 0.04),
      ),
    );
  }
}
