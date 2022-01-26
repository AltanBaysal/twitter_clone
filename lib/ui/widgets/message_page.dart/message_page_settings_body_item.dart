import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/constants/english_constants.dart';

class MessagePageSettingsBodyItem extends StatefulWidget {
  const MessagePageSettingsBodyItem({
    Key? key,
    required this.titleText,
    required this.explainertext,
    required this.learnMoreFunc,
    required this.isSwitched,
    required this.switchFunc({required bool isSwitched}),
  }) : super(key: key);

  final String titleText;
  final String explainertext;
  final Function learnMoreFunc;
  final Function({required bool isSwitched}) switchFunc;
  final bool isSwitched; 

  @override
  State<MessagePageSettingsBodyItem> createState() =>
      _MessagePageSettingsBodyItemState();
}

class _MessagePageSettingsBodyItemState extends State<MessagePageSettingsBodyItem> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: height*0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.titleText,style: TextStyle(fontSize: height*0.022),softWrap: true,),

                RichText(
                  softWrap: true,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(text: widget.explainertext,style: TextStyle(color: ColorsConstant.lightBlack,fontSize: height*0.020)),
                      TextSpan(
                        text: EnglishTexts.messagePageSettingsBodyItemClickableBlueText,
                        style: TextStyle(color: Colors.blue,fontSize: height*0.020),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            widget.learnMoreFunc();
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(
            width: width * 0.15 ,
            child: Center(
              child: Switch(
                value: widget.isSwitched,
                onChanged: (value) {
                  widget.switchFunc(isSwitched:value);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}