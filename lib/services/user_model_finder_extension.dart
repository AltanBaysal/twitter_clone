import 'package:twitter/models/user_model.dart';

extension UserModelFinderExtension on List<UserModel> {
  UserModel userModelFinderByEmail({required String userEmail}) {
    return firstWhere((element) => element.userEmail == userEmail);
  }
}
