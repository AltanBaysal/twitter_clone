import 'package:flutter/material.dart';
import 'package:twitter/constants/english_constants.dart';
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
      title:EnglishTexts.appName,  //!Constant hale getir
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
  splash screen eklendi

*/


//visibilty widget

//TODO
//message reaction
// add seen for message
//splash screen
//get the scrollview top when user click twitter logo on the sliverappbar 

//make functional chatpageinfo 
//add bottom border to sliverappbar but it isnt working
//add page transition animation flutter

//look at ...
//class constructor ları isimlendirilmiş yapmaya bak