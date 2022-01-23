import 'package:flutter/material.dart';

class ChatPageInfoTextButton extends StatelessWidget {
  const ChatPageInfoTextButton({
    Key? key,
    required this.text,
    required this.func,
    this.textColor,
    
  }) : super(key: key);

  final String text;
  final Color? textColor;
  final Function func;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        func();
      },

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.025),
        alignment: Alignment.centerLeft,
        height: height * 0.06,
        child: Text(text,
          style: TextStyle(color: textColor ?? Colors.grey, fontSize: width * 0.040),
        ),
      ),
    );
  }
}
