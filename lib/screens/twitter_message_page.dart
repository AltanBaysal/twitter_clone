import 'package:flutter/material.dart';
import 'package:twitter/main.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/screens/twitter_message_page_settings.dart';
import 'package:twitter/services/localization_service.dart';
import 'package:twitter/ui/helper/custom_slide_page_route.dart';
import 'package:twitter/ui/widgets/appbar/appbar_ui/appbar.dart';
import 'package:twitter/ui/widgets/appbar/home_page_appbar_with_searchbar_and_setting.dart';
import 'package:twitter/ui/widgets/chat.dart';

class TwitterMessagePage extends StatefulWidget {
  const TwitterMessagePage({
    Key? key,
  }) : super(key: key);

  @override
  _TwitterMessagePageState createState() => _TwitterMessagePageState();
}

class _TwitterMessagePageState extends State<TwitterMessagePage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxScrolled) => [
        AppbarUI(
          appbaritems: HomePageAppbarWithSearchBarAndSettings(
            searchBarText: LocalizationService.of()
                .getLocale
                .messagePageAppbarSearchTittle,
            searchBarFunc: () {},
            settingButtonFunc: () {
              Navigator.of(context).push(
                CustomSlidePageRoute(
                  direction: AxisDirection.up,
                  child: const MessagePageSetting(),
                ),
              );
            },
          ),
        ),
      ],
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: selectedUser.conversations.length,
          itemBuilder: (context, index) => Chat(
            conversation: selectedUser.conversations[index],
            onChange: () {
              setState(() {});
            },
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
