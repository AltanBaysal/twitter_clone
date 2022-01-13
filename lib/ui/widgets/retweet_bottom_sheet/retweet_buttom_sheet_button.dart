import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RetweetButtomSheetButton extends StatelessWidget {
  const RetweetButtomSheetButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.image,
    required this.func,
  }) : super(key: key);


  //?bunları kullanırken widget.yapmama gerek varmı
  final double width;
  final double height;
  final String text;
  final String image;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        func();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.08, vertical: height * 0.02),
        child: Row(
          children: [
            SvgPicture.asset(image, fit: BoxFit.cover),
            SizedBox(width: width * 0.05),
            Text(
              text,
              style: TextStyle(fontSize: width * 0.0375),
            ),
          ],
        ),
      ),
    );
  }
}
