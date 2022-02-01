import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/ui/widgets/chat_page_widgets.dart/chat_page_info_alert_dialog.dart';
import 'package:twitter/ui/widgets/chat_page_widgets.dart/chat_page_info_text_button.dart';
import 'package:twitter/ui/widgets/common/basic_text_with_switch.dart';
import '../main.dart';

class ChatPageInfo extends StatefulWidget {
  const ChatPageInfo(
      {Key? key,
      required this.user,
      required this.onChange,
      required this.oppositeUserEmail})
      : super(key: key);

  final UserModel user;
  final String oppositeUserEmail;
  final VoidCallback onChange;

  @override
  State<ChatPageInfo> createState() => _ChatPageInfoState();
}

class _ChatPageInfoState extends State<ChatPageInfo> {
  bool toggleSwitch = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Text(
          local.chatPageInfoAppBarTitle,
          style: TextStyle(fontSize: height * 0.03, color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.025),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: CircleAvatar(
                radius: width * 0.1,
                backgroundImage: NetworkImage(widget.user.userProfilePicture),
              ),
            ),
          ),
          
          Text(
            widget.user.username,
            style: TextStyle(
                color: Colors.black,
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold),
          ),
          
          Text(
            widget.user.userEmail,
            style: TextStyle(
                color: ColorsConstant.lightBlack, fontSize: width * 0.03),
          ),
          
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey),
                  top: BorderSide(width: 0.5, color: Colors.grey)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: height * 0.03, horizontal: width * 0.025),
                  child: Text(
                    local.chatPageInfoBodyNotifications,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                BasicTextWithSwitch(
                    text: local.chatPageInfoBodySnoozeNotifications,
                    height: height * 0.06,
                    isSwitched: toggleSwitch,
                    switchFunc: ({required bool isSwitched}) {
                      setState(
                        () {
                          toggleSwitch = isSwitched;
                        },
                      );
                    })
              ],
            ),
          ),
          
          ChatPageInfoTextButton(
            text: local.chatPageInfoBodyBlock + selectedUser.userEmail,
            textColor: Colors.blue,
            func: () {},
          ),
          
          ChatPageInfoTextButton(
            text: local.chatPageInfoBodyReport + selectedUser.userEmail,
            textColor: Colors.blue,
            func: () {},
          ),
          
          ChatPageInfoTextButton(
            text: local.chatPageInfoBodyDeleteConversation,
            textColor: Colors.red,
            func: () {
              showDialog(
                context: context,
                builder: (context) => ChatPageInfoAlertDialog(
                  func: () {
                    selectedUser.deleteConversation(oppositeUserEmail: widget.oppositeUserEmail);
                    widget.onChange(); //? çok fazla widget ın içinden onChange geçirmek zorunda kalınca statemanagment ın değerini anladım
                    Navigator.of(context).pop(); //? bunu çalışmasını beklemiyordum ama çalıştı
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
