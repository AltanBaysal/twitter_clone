import 'package:twitter/models/user_model.dart';
import 'package:twitter/services/create_users.dart';

//Buradaki fonksiyon ismi toggle follow state olarak degisebilir.
void followUser(){
  selectedUser.followOrUnfollow(email: "@User_2"); 
  users[1].followOrUnfollow(email:"@Mr.Stark");
  users[2].followOrUnfollow(email:"@Mr.Stark");
}