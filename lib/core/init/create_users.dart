import 'package:provider/provider.dart';
import 'package:twitter/controllers/tweets_state.dart';
import 'package:twitter/core/functions/global_key.dart';
import 'package:twitter/models/user_model.dart';

List<UserModel> users = [];

void createUsers() {
  Provider.of<TweetsState>(GlobalContextKey.instance.globalKey.currentContext!)
      .createUser(
    UserModel(
      "Mr.Stark",
      "@Mr.Stark",
      "123456",
      "https://instagram.fada2-1.fna.fbcdn.net/v/t51.2885-19/s150x150/130449922_891080031637366_92203762495301097_n.jpg?_nc_ht=instagram.fada2-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=YwAKhTs0DlYAX8hnysH&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT-ByvdAR6_WEwoxPiGP7Yi0Lmjvn0EgHNl3-Xu0du_Gsw&oe=620766B9&_nc_sid=7bff83",
    ),
  );
  
  Provider.of<TweetsState>(GlobalContextKey.instance.globalKey.currentContext!)
      .createUser(
    UserModel(
      "User2",
      "@User_2",
      "123456",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnJAabyseF4kY9fWKg6dQeLRQgwl-Uaujhqg&usqp=CAU",
    ),
  );

  Provider.of<TweetsState>(GlobalContextKey.instance.globalKey.currentContext!)
      .createUser(
    UserModel(
      "User3",
      "@User3_3!",
      "654321",
      "https://forum.donanimarsivi.com/attachments/1600557477521-jpeg.58079/",
    ),
  );
}
