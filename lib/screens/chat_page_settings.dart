import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/constants/english_constants.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/chat_page_settings_body_item.dart';

class ChatPageSetting extends StatefulWidget {
  const ChatPageSetting({Key? key}) : super(key: key);

  @override
  _ChatPageSettingState createState() => _ChatPageSettingState();
}

class _ChatPageSettingState extends State<ChatPageSetting> {
  //? bu yanlış bir kullanım muhtemelen
  bool filterMessagesSwitch = false;
  bool allowMessageSwitch = false;
  bool showReceiptsSwitch = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              EnglishTexts.chatPageSettingsAppBarTitle,
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
            ChatPageSettingsBodyItem(
              isSwitched: allowMessageSwitch,
              titleText:EnglishTexts.chatPageSettingsBodyToggleAllowMessageTextTitle,
              explainertext:EnglishTexts.chatPageSettingsBodyToggleAllowMessageText,
              learnMoreFunc: () {},
              switchFunc: ({required bool isSwitched}) {
                setState(() {allowMessageSwitch = isSwitched;},
                );
              },
            ),

            if (allowMessageSwitch)
              ChatPageSettingsBodyItem(
                isSwitched: filterMessagesSwitch,
                titleText:EnglishTexts.chatPageSettingsBodyFilterMessageTextTitle,
                explainertext:EnglishTexts.chatPageSettingsBodyFilterMessageText,
                learnMoreFunc: () {},
                switchFunc: ({required bool isSwitched}) {
                  setState(() {filterMessagesSwitch = isSwitched;},);
                },
              ),


            ChatPageSettingsBodyItem(
              isSwitched: showReceiptsSwitch,
              titleText: EnglishTexts.chatPageSettingsBodyShowReceiptsTextTitle,
              explainertext: EnglishTexts.chatPageSettingsBodyShowReceiptsText,
              learnMoreFunc: () {},
              switchFunc: ({required bool isSwitched}) {
                setState(() {showReceiptsSwitch = isSwitched;},);
              },
            ),
          ],
        ),
      ),
    );
  }
}
