import 'package:twitter/models/user_model.dart';

List<UserModel> users = [];

List<UserModel> createUsers() {
  return [
    UserModel(
      "Mr.Stark",
      "@Mr.Stark",
      "123456",
      "https://instagram.fgzt3-1.fna.fbcdn.net/v/t51.2885-19/s150x150/130449922_891080031637366_92203762495301097_n.jpg?_nc_ht=instagram.fgzt3-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=Gbh5BdBKtskAX9GotoI&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT_4QAQtQBSXqi4I5uz76_x26P3m2a7Gbvp1OC1QipxMvQ&oe=61F794B9&_nc_sid=7bff83",
    ),

    UserModel(
      "User2",
      "@User_2",
      "123456",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnJAabyseF4kY9fWKg6dQeLRQgwl-Uaujhqg&usqp=CAU",
    ),

    UserModel(
      "User3",
      "@User3_3!",
      "654321",
      "https://forum.donanimarsivi.com/attachments/1600557477521-jpeg.58079/",
    ),
    
  ];
}

