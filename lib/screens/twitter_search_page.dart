import 'package:flutter/material.dart';
import 'package:twitter/core/init/create_topics.dart';
import 'package:twitter/screens/twitter_search_page_search_screen.dart';
import 'package:twitter/services/localization_service.dart';
import 'package:twitter/ui/widgets/appbar/appbar_ui/appbar.dart';
import 'package:twitter/ui/widgets/appbar/home_page_appbar_with_searchbar_and_setting.dart';
import 'package:twitter/ui/widgets/search_page_trend_widget.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxScrolled) => [
        AppbarUI(
          appbaritems: HomePageAppbarWithSearchBarAndSettings(
            searchBarText: "Search Twitter", //! l10
            searchBarFunc: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const TwitterSearchPageSearchScreen()),
              );
            },
            settingButtonFunc: () {},
          ),
        ),
      ],
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: width,
                  height: height * 0.29,
                  margin: EdgeInsets.only(bottom: height * 0.001),
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: width * 0.04),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://pbs.twimg.com/semantic_core_img/1255910073831788550/xm0-QtpW?format=jpg&name=small"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        LocalizationService.of()
                            .getLocale
                            .twitterSearchPageImageTopic,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        LocalizationService.of()
                            .getLocale
                            .twitterSearchPageImageTitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(width: 0.5, color: Colors.grey)),
                ),
                width: width,
                padding: EdgeInsets.fromLTRB(
                    width * 0.04, height * 0.02, width * 0.04, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  LocalizationService.of()
                      .getLocale
                      .twitterSearchPageTrendsForYou,
                  style: TextStyle(
                      fontSize: width * 0.05,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: trends.length,
                itemBuilder: (context, index) => TrendWidget(
                  hashtag: trends[index].hashtag,
                  countOfTweetsContainHashtag:
                      trends[index].countOfTweetsContainHashtag,
                  clickFunc: () {},
                ),
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
