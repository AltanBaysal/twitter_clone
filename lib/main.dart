import 'package:flutter/material.dart';
import 'package:twitter/core/init/create.dart';
import 'package:twitter/screens/twitter_main_page.dart';


void main() {
  create();
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: const TwitterMainPage(),
    );
  }
}


/* Yapılanlar
  
  Constant düzlendi
  TwitterBottomNavigationBar düzlendi
  Square_svg_icon_creater_from_string_with_sized_box.dart eklendi
  PageChooser enum olarak çalışacak hale getirldi ama doğru olarak yaptım mı tam emin değilim
  EnglishText ve IconConst a yeni eklemeler yapıldı
  chat_page_setting.dart eklendi
  chat_page_settings_body_item.dart eklendi
  
*/


//TODO
//appbarların altına çizgi ekle
//textleri de constant haline getir
//chatpage geçiş animasyonu
//class constructor ları isimlendirilmiş yapmaya bak