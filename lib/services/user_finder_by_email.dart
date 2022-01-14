import 'package:collection/src/iterable_extensions.dart';
import 'package:twitter/assets/constatns.dart';
import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/user_model.dart';


//? hangisi daha iyi ?
UserModel? userFinderByEmail({required String userEmail,required List<UserModel> list}) {
  UserModel? a;

  try{
    a = list.firstWhere((element) => element.userEmail == userEmail);
  }catch(e){
    a = null;
  }

  return a;
}

UserModel userFinderByEmail2({required String mailOfUser}) {
  UserModel? user = users.firstWhereOrNull((element) => element.userEmail == mailOfUser);  
  if (user == null) throw Exception(ErrorMessages.userNotFound);
  return user;
}
