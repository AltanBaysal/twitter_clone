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

//TODO
//appbarların altına çizgi ekle
//textleri de constant haline getir
//chatpage geçiş animasyonu
//class constructor ları isimlendirilmiş yapmaya bak