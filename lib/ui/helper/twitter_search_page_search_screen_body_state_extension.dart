import 'package:flutter/material.dart';
import 'package:twitter/ui/enums/twitter_search_page_search_screen_body_state.dart';
import 'package:twitter/ui/widgets/twitter_search_page/twitter_search_page_search_screen_bodys/twitter_search_page_search_screen_body_conclusion.dart';
import 'package:twitter/ui/widgets/twitter_search_page/twitter_search_page_search_screen_bodys/twitter_search_page_search_screen_body_search_something.dart';

extension TwitterSearchPageSearchScreenBodyStateExtension
    on TwitterSearchPageSearchScreenBodyState {
  Widget chooseBody() {
    switch (this) {
      case TwitterSearchPageSearchScreenBodyState.searchSomethingState:
        return const TwitterSearchPageSearchScreenBodySearchSomething();
        
      case TwitterSearchPageSearchScreenBodyState.conclusionState:
        return const TwitterSearchPageSearchScreenBodyConclusion();
    }
  }
}
