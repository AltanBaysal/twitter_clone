import 'package:twitter/models/user_model.dart';

UserModel? userFinderByEmailOrNull({required String userEmail ,required List<UserModel> list}) {
  UserModel? a;

  try{
    a = list.firstWhere((element) => element.userEmail == userEmail);
  }catch(e){
    a = null;
  }

  return a;
}

UserModel userFinderByEmail({required String userEmail ,required List<UserModel> list}) {
  return list.firstWhere((element) => element.userEmail == userEmail);
}
