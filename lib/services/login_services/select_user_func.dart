import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/services/user_model_finder_extension.dart';

//? bunu buraya ekledim
void selectUser({required String userEmail, required String password}) {
  UserModel user = users.userModelFinderByEmail(userEmail: userEmail);
  selectedUser = user;
}