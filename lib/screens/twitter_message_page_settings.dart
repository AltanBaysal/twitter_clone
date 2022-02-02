import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/message_page.dart/message_page_settings_body_item.dart';

import '../main.dart';

class MessagePageSetting extends StatefulWidget {
  const MessagePageSetting({Key? key}) : super(key: key);

  @override
  _MessagePageSettingState createState() => _MessagePageSettingState();
}

class _MessagePageSettingState extends State<MessagePageSetting> {

  bool allowMessageSwitch = false;
  bool filterMessagesSwitch = false;
  bool showReceiptsSwitch = false;

  bool toggleOpacityFilterMessageWidget = false;

  void _changeFilterMessageWidgetOpacity() {
    if (allowMessageSwitch) {
      setState(() {
        toggleOpacityFilterMessageWidget = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
              local.messagePageSettingsAppBarTitle,
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
      body: Column(
        children: [
          MessagePageSettingsBodyItem(
            isSwitched: allowMessageSwitch,
            titleText: local
                .messagePageSettingsBodyToggleAllowMessageTextTitle,
            explainertext:
                local.messagePageSettingsBodyToggleAllowMessageText,
            learnMoreFunc: () {},
            switchFunc: ({required bool isSwitched}) {
              setState(
                () {
                  allowMessageSwitch = isSwitched;
                  if (!allowMessageSwitch) {
                    toggleOpacityFilterMessageWidget = false;
                  }
                },
              );
            },
          ),
          
          AnimatedContainer(
            onEnd: _changeFilterMessageWidgetOpacity,
            duration: const Duration(milliseconds: 300),
            constraints: BoxConstraints(
              maxHeight: allowMessageSwitch ? height : 0,
            ), 
            curve: Curves.easeIn,
            child: SingleChildScrollView(
              child: Opacity(
                opacity: toggleOpacityFilterMessageWidget ? 1 : 0,
                child: MessagePageSettingsBodyItem(
                  isSwitched: filterMessagesSwitch,
                  titleText: local
                      .messagePageSettingsBodyFilterMessageTextTitle,
                  explainertext:
                      local.messagePageSettingsBodyFilterMessageText,
                  learnMoreFunc: () {},
                  switchFunc: ({required bool isSwitched}) {
                    setState(() {
                      filterMessagesSwitch = isSwitched;
                    });
                  },
                ),
              ),
            ),
          ),
        
          MessagePageSettingsBodyItem(
            isSwitched: showReceiptsSwitch,
            titleText:
                local.messagePageSettingsBodyShowReceiptsTextTitle,
            explainertext:
                local.messagePageSettingsBodyShowReceiptsText,
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
    );
  }
}

//expensiontile denemesi
/*
//for ExpansionTile
  UniqueKey keyTile = UniqueKey();
  void expandtile(){
    setState(() {
      keyTile = UniqueKey();
    });
  }

ExpansionTile(
              
              trailing: const SizedBox.shrink(),
              key: keyTile,
              initiallyExpanded: allowMessageSwitch,
              textColor: Colors.black,
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,

              title: MessagePageSettingsBodyItem(
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
                      expandtile();
                      if (!allowMessageSwitch) {
                        toggleOpacityFilterMessageWidget = false;
                      }
                    },
                  );
                },
              ),

              children: [
                MessagePageSettingsBodyItem(
                  isSwitched: filterMessagesSwitch,
                  titleText: EnglishTexts
                      .messagePageSettingsBodyFilterMessageTextTitle,
                  explainertext:
                      EnglishTexts.messagePageSettingsBodyFilterMessageText,
                  learnMoreFunc: () {},
                  switchFunc: ({required bool isSwitched}) {
                    setState(() {
                      filterMessagesSwitch = isSwitched;
                    });
                  },
                ),
              ],
            ),

*/