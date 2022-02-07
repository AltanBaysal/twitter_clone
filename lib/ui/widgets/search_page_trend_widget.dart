import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/main.dart';
import 'package:twitter/services/localization_service.dart';

class TrendWidget extends StatelessWidget {
  const TrendWidget({
    Key? key,
    required this.hashtag,
    required this.countOfTweetsContainHashtag,
    required this.clickFunc,
  }) : super(key: key);

  final String hashtag;
  final int countOfTweetsContainHashtag;
  final Function clickFunc;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        clickFunc();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.04),
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocalizationService.of()
                      .getLocale
                      .twitterSearchPageTrendWidgetHeader,
                  style: TextStyle(
                      color: ColorsConstant.darkGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.036),
                ),
                Divider(height: height * 0.004, color: Colors.transparent),
                Text(
                  hashtag,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.045),
                ),
                Divider(height: height * 0.004, color: Colors.transparent),
                Text(
                  "$countOfTweetsContainHashtag ${LocalizationService.of().getLocale.twitterSearchPageTrendWidgetTweets}",
                  style: TextStyle(
                      color: ColorsConstant.grey, fontSize: width * 0.036),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              customBorder: const CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                  size: width * 0.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
