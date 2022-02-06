import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:twitter/controllers/controller_list.dart';
import 'package:twitter/core/init/create.dart';
import 'package:twitter/screens/twitter_main_page.dart';
import 'package:twitter/services/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:twitter/services/localization_service.dart';

void main() {
  create();
  runApp(
    MultiProvider(
      providers: controllerList,
      child: const MyApp(),
    ),
  );
}

late AppLocalizations local;



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) {
        local = LocalizationService(context).of(context).getLocale;
        return LocalizationService(context).getLocale.appName;
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      home: const TwitterMainPage(),
    );
  }
}


//TODO
//message reaction
//add seen for message
//get the scrollview top when user click twitter logo on the sliverappbar 

//make functional chatpageinfo 
//add bottom border to sliverappbar but it isnt working

//look at ...
//class constructor ları isimlendirilmiş yapmaya bak