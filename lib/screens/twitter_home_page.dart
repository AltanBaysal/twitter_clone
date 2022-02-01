import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/models/tweet_model.dart';
import 'package:twitter/ui/widgets/appbar/appbar_ui/appbar.dart';
import 'package:twitter/ui/widgets/appbar/home_page_default_appbar_items.dart';
import 'package:twitter/ui/widgets/tweet/tweet.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.tweets,
  }) : super(key: key);

  final List<TweetModel> tweets;

  @override
  _TwitterMainPageState createState() => _TwitterMainPageState();
}

class _TwitterMainPageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxScrolled) => [
        const AppbarUI(appbaritems: HomepageAppBar()),
      ],
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(
            thickness: 1,
            color: ColorsConstant.lightGrey,
          ),
          itemCount: widget.tweets.length,
          itemBuilder: (context, index) => Tweet(
            tweet: widget.tweets.reversed.toList()[index],
            user: widget.tweets.reversed.toList()[index].userOfTweet(),
          ),
        ),
      ),
    );
  }

  Future _refresh() {
    setState(() {});
    return Future.value(true);
  }
}
