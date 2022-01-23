import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/constants/english_constants.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/message_page.dart/message_page_settings_body_item.dart';

class MessagePageSetting extends StatefulWidget {
  const MessagePageSetting({Key? key}) : super(key: key);

  @override
  _MessagePageSettingState createState() => _MessagePageSettingState();
}

class _MessagePageSettingState extends State<MessagePageSetting> {
  //? bu yanlış bir kullanım muhtemelen
  bool filterMessagesSwitch = false;
  bool allowMessageSwitch = false;
  bool showReceiptsSwitch = false;
  
  bool toggleActiveFilterMessageWidget = false;

  void _changeFilterMessageWidget() {
    if (allowMessageSwitch) {
      setState(() {
        toggleActiveFilterMessageWidget = allowMessageSwitch;
      });
    }
  }
 

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    if(!allowMessageSwitch) toggleActiveFilterMessageWidget = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              EnglishTexts.messagePageSettingsAppBarTitle,
              style: TextStyle(color: Colors.black, fontSize: height * 0.03),
            ),
            Text(
              selectedUser.userEmail,
              style: TextStyle(
                  color: ColorsConstant.grey, fontSize: height * 0.022),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.03),
        child: Column(
          children: [
            
            MessagePageSettingsBodyItem(
              isSwitched: allowMessageSwitch,
              titleText: EnglishTexts
                  .messagePageSettingsBodyToggleAllowMessageTextTitle,
              explainertext:
                  EnglishTexts.messagePageSettingsBodyToggleAllowMessageText,
              learnMoreFunc: () {},
              switchFunc: ({required bool isSwitched}) {
                setState(
                  () {
                    allowMessageSwitch = isSwitched;
                  },
                );
              },
            ),
            
            AnimatedContainer(
              
              duration: const Duration(milliseconds: 300),
              onEnd: _changeFilterMessageWidget,
              curve: Curves.easeIn,
              height: allowMessageSwitch ? height*0.214 : 0, //? bura hiç olmadı çözmek için 1,2 saat uğraştım ama hiç bir şey bulamadım
              //widget ın boyutunu alamıyorum çünkü kaldırdığımda null oluyor

              child: (toggleActiveFilterMessageWidget)
                  ? MessagePageSettingsBodyItem(
                      isSwitched: filterMessagesSwitch,
                      titleText: EnglishTexts.messagePageSettingsBodyFilterMessageTextTitle,
                      explainertext:EnglishTexts.messagePageSettingsBodyFilterMessageText,
                      learnMoreFunc: () {},
                      switchFunc: ({required bool isSwitched}) {
                        setState(
                          () {
                            filterMessagesSwitch = isSwitched;
                          },
                        );
                      },
                    )
                  : null,
            ),
            
            MessagePageSettingsBodyItem(
              isSwitched: showReceiptsSwitch,
              titleText:
                  EnglishTexts.messagePageSettingsBodyShowReceiptsTextTitle,
              explainertext:
                  EnglishTexts.messagePageSettingsBodyShowReceiptsText,
              learnMoreFunc: () {},
              switchFunc: ({required bool isSwitched}) {
                setState(
                  () {
                    showReceiptsSwitch = isSwitched;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
