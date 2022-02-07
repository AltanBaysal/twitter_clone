import 'package:flutter/material.dart';
import 'package:twitter/services/localization_service.dart';

class ChatPageInfoAlertDialog extends StatelessWidget {
  const ChatPageInfoAlertDialog({Key? key, required this.func})
      : super(key: key);

  final Function func;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: Text(LocalizationService.of()
          .getLocale
          .chatPageInfoBodyDeleteConversationAlertDialogTitleText),
      titlePadding: EdgeInsets.symmetric(
          horizontal: width * 0.06, vertical: height * 0.02),
      contentPadding: EdgeInsets.symmetric(horizontal: width * 0.06),
      content: Text(LocalizationService.of()
          .getLocale
          .chatPageInfoBodyDeleteConversationAlertDialogContentText),
      actions: [
        ChatPageAletDialogActionsButton(
            text: LocalizationService.of()
                .getLocale
                .chatPageInfoBodyDeleteConversationAlertDialogActionsCancel),
        ChatPageAletDialogActionsButton(
            text: LocalizationService.of()
                .getLocale
                .chatPageInfoBodyDeleteConversationAlertDialogActionsDelete,
            func: () {
              func();
            }),
      ],
    );
  }
}

class ChatPageAletDialogActionsButton extends StatelessWidget {
  const ChatPageAletDialogActionsButton(
      {Key? key, required this.text, this.func})
      : super(key: key);

  final String text;
  final Function? func;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.015),
      ),
      onTap: () {
        Navigator.of(context).pop();
        if (func != null) func!();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: height * 0.008, horizontal: width * 0.02),
        padding: EdgeInsets.symmetric(
            vertical: height * 0.008, horizontal: width * 0.01),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.042),
        ),
      ),
    );
  }
}
