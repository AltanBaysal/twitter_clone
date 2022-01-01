import 'package:twitter/user.dart';

extension listExtension on List<User>{

  User? firstUserOrnull(String email){
    for(var i =0; i < this.length;i++){
      if(this[i].userEmail == email){
        return this[i];
      }
    }
    return null;
  }
}