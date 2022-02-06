
import 'package:twitter/models/user_model.dart';

extension SearchUserNameForKeyword on List<UserModel>{
  List<UserModel> searchTweetsTextForKeyword(String keyWords){
    return where((element) => element.username.toLowerCase().contains(keyWords.toLowerCase())).toList();
  }
} 