import 'package:twitter/models/user_model.dart';

extension ListExtension on List<UserModel>{

  UserModel? firstUserOrnull({required String email}){
    for(var i =0; i < length;i++){
      if(this[i].userEmail == email){
        return this[i];
      }
    }
    return null;
  }
}