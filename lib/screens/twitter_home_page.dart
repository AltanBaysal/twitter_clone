import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/controllers/tweets_state.dart';
import 'package:twitter/ui/widgets/appbar/appbar_ui/appbar.dart';
import 'package:twitter/ui/widgets/appbar/home_page_default_appbar_items.dart';
import 'package:twitter/ui/widgets/tweet/tweet.dart';

class TwitterHomePage extends StatelessWidget { //+
  const TwitterHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxScrolled) => [
        const AppbarUI(appbaritems: HomepageAppBar()),
      ],

      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: Consumer<TweetsState>(
          builder: (_, value, __) => ListView.separated(
            padding: const EdgeInsets.only(top: 0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
              color: ColorsConstant.lightGrey,
            ),
            itemCount: value.tweets.length,
            itemBuilder: (context, index) => TweetWidget(tweet: value.tweets[index],
            ),
          ),
        ),
      ),
    );
  }
  
  Future _refresh() {
    return Future.value(true);
  }
}
