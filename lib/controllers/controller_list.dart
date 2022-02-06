import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:twitter/controllers/tweets_state.dart';
import 'package:twitter/controllers/twitter_search_page_search_state.dart';

List<SingleChildWidget> controllerList = [
  ChangeNotifierProvider<TweetsState>(create: (_) => TweetsState()),
  ChangeNotifierProvider<TwitterSearchPageSearchState>(create: (_) => TwitterSearchPageSearchState()),
];
