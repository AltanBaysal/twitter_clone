
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


Widget retweetButtomSheetButtonPart(
    {required double width,
    required double height,
    required String text,
    required String image,
    required Function func}) {
  return InkWell(
    onTap: () {func();},
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.08, vertical: height * 0.02),
      child: Row(
        children: [
          SvgPicture.asset(image, fit: BoxFit.cover),
          SizedBox(width: width * 0.05),
          Text(
            text,
            style: TextStyle(fontSize: width*0.375),
          ),
        ],
      ),
    ),
  );
}