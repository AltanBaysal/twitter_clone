import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/core/init/create_topics.dart';
import 'package:twitter/main.dart';
import 'package:twitter/ui/widgets/appbar/appbar_ui/appbar.dart';
import 'package:twitter/ui/widgets/appbar/home_page_appbar_with_searchbar_and_setting.dart';

class TwitterSearchPage extends StatefulWidget {
  const TwitterSearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TwitterSearchPage> createState() => _TwitterSearchPageState();
}

class _TwitterSearchPageState extends State<TwitterSearchPage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxScrolled) => [
        AppbarUI(
          appbaritems: HomePageAppbarWithSearchBarAndSettings(
            searchBarText: "Search Twitter",
            searchBarFunc: () {},
            settingButtonFunc: () {},
          ),
        ),
      ],
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(),

              ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: trends.length,
                itemBuilder: (context, index) => TrendWidget(hashtag: trends[index].hashtag, countOfTweetsContainHashtag: trends[index].countOfTweetsContainHashtag,clickFunc: (){},),
              ),
            ],
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
      onTap: (){clickFunc();},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.04),
        width: width,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(local.TwitterSearchPageTrendWidgetHeader,style: TextStyle(color: ColorsConstant.darkGrey ,fontWeight: FontWeight.bold,fontSize: width*0.036),),
                Divider(height: height*0.004,color: Colors.transparent),
                Text(hashtag,style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold,fontSize: width*0.045),),
                Divider(height: height*0.004,color: Colors.transparent),
                Text("$countOfTweetsContainHashtag ${local.TwitterSearchPageTrendWidgetTweets}",style: TextStyle(color: ColorsConstant.grey ,fontSize: width*0.036),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}