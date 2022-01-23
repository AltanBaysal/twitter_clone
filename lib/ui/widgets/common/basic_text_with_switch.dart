import 'package:flutter/material.dart';

class BasicTextWithSwitch extends StatelessWidget {
  const BasicTextWithSwitch(
      {Key? key,
      required this.text,
      required this.isSwitched,
      required this.switchFunc({required bool isSwitched}),
      this.textFontsize,
      this.height})
      : super(key: key);

  final double? textFontsize;
  final double? height;

  final String text;
  final Function({required bool isSwitched}) switchFunc;
  final bool isSwitched;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        switchFunc(isSwitched: !isSwitched);
      },

      //? custom height kullanımı için daha iyi bir çözümün var mı?
      child: height == null
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(fontSize: textFontsize ?? width * 0.040),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      switchFunc(isSwitched: value);
                    },
                  )
                ],
              ),
            )
          : Container(
              height: height,
              padding: EdgeInsets.symmetric(horizontal: width * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(fontSize: textFontsize ?? width * 0.040),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      switchFunc(isSwitched: value);
                    },
                  )
                ],
              ),
            ),
    );
  }
}
