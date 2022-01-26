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

  bool toggleOpacityFilterMessageWidget = false;

  Duration filterMessageWidgetAnimationDuration =const Duration(milliseconds: 300);//? bunu constant yapmalı mıyım ?
  
  void _changeFilterMessageWidgetOpacity() {
    if (allowMessageSwitch) {
      Future.delayed(filterMessageWidgetAnimationDuration*1.2, () {
        setState(() {
          toggleOpacityFilterMessageWidget = true;
        });
      });
    } else {
      toggleOpacityFilterMessageWidget = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    _changeFilterMessageWidgetOpacity();

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
            
            AnimatedSize(
              //? muhtemelen çok kötü bir yolla çözdüm  ama yinede bunu yapmam saatlerimi aldı
              //? çok hızlı açıp kapatınca sıkıntı çıkıyor  direk animated size bağlı animated containerdaki on end gibi bir şey lazım
              duration: filterMessageWidgetAnimationDuration,
              curve: Curves.easeIn,
              child: Opacity(
                opacity: toggleOpacityFilterMessageWidget ? 1:0,
                child: Visibility(
                  visible: allowMessageSwitch,
                  child: MessagePageSettingsBodyItem(
                    isSwitched: filterMessagesSwitch,
                    titleText: EnglishTexts
                        .messagePageSettingsBodyFilterMessageTextTitle,
                    explainertext:
                        EnglishTexts.messagePageSettingsBodyFilterMessageText,
                    learnMoreFunc: () {},
                    switchFunc: ({required bool isSwitched}) {
                      setState(
                        () {
                          filterMessagesSwitch = isSwitched;
                        },
                      );
                    },
                  ),
                ),
              ),
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
