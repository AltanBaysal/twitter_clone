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
      title:"Twitter Clone",  //!Constant hale getir
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
  message_page_setting.dart eklendi
  message_page_settings_body_item.dart eklendi

  extras
  common folder in widget with text_with_switch.dart,
  chat_page_info.dart   chatpage in sol üste info butonu ile girilen  info bölümünün ui tasarımı yapıldı
  chat_page_info_text_button.darts 

*/


//animated container
//TODO
//messagepage settings animation +


//message reaction
//seen
//açılış ekranı
//twitter iconuna basınca en yukarı çıkmayı yap

//chatpageinfo fonksiyonel yap
//appbarların altına çizgi ekle
//chatpage geçiş animasyonu //page transition animation flutter

//... olayına bak
//class constructor ları isimlendirilmiş yapmaya bak