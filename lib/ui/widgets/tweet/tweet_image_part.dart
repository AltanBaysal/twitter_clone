import 'package:flutter/material.dart';

class TweetImagePart extends StatelessWidget {
  const TweetImagePart({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      child: Image.network(image),
    );
  }
}
