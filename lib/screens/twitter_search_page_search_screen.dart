import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/controllers/twitter_search_page_search_state.dart';
import 'package:twitter/ui/helper/twitter_search_page_search_screen_body_state_extension.dart';
import 'package:twitter/ui/widgets/twitter_search_page/twitter_search_page_search_screen_search_bar.dart';

class TwitterSearchPageSearchScreen extends StatelessWidget {
  const TwitterSearchPageSearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchBar(),
            Expanded(
              child: Consumer<TwitterSearchPageSearchState>(
                builder: (_, value, __) => SingleChildScrollView(
                  child: value.searchScreenBodyState.chooseBody(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
