import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/user_model.dart';


//Buradaki fonksiyon ismi toggle follow state olarak degisebilir.
void followUser(){
  selectedUser.followUserToggle(email: "@User_2"); 
  users[1].followUserToggle(email:"@Mr.Stark");
  users[2].followUserToggle(email:"@Mr.Stark");
}