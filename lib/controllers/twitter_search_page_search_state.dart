import 'package:flutter/foundation.dart';
import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/main.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/services/search_user_name_for_keyword.dart';
import 'package:twitter/ui/enums/twitter_search_page_search_screen_body_state.dart';


class TwitterSearchPageSearchState with ChangeNotifier , DiagnosticableTreeMixin{

  String _searchBarText = ""; //? bunları late veremiyor muyum ?
  TwitterSearchPageSearchScreenBodyState _searchScreenBodyState = TwitterSearchPageSearchScreenBodyState.searchSomethingState;


  String get searchBarText => _searchBarText;
  TwitterSearchPageSearchScreenBodyState get searchScreenBodyState => _searchScreenBodyState;

  String get searchForText => '${local.twitterSearchPageSearchScreenSearchForText}:"$_searchBarText"';
  String get goToText =>  local.twitterSearchPageSearchScreenGoToText+_searchBarText;

  List<UserModel> get filteredUserListBySearchBarText => users.searchTweetsTextForKeyword(_searchBarText);
  

  bool isSearchBarTextEmpty(){
    return _searchBarText.isEmpty;
  }

  void searchBarOnChangeText({required String text}){
    _searchBarText = text;
    _searchScreenBodyState = searchScreenBodyStateChooser();
    notifyListeners();
  }




  TwitterSearchPageSearchScreenBodyState searchScreenBodyStateChooser(){
    if(_searchBarText.isEmpty) return TwitterSearchPageSearchScreenBodyState.searchSomethingState;
    return TwitterSearchPageSearchScreenBodyState.conclusionState;
  }




  @override  //? bu gerekli mi bana o kadar gerekli gibi gelmedi
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('searhBartText', _searchBarText));
  }
}