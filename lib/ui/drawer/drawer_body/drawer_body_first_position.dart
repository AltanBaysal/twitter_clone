import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/ui/drawer/drawer_body/drawer_scrollview_button.dart';

Widget drawerBodyFirstPositionUpperPart(
    {required double height, required double width}) {
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: height * 0.02, top: height * 0.02),
            height: 0.5,
            color: Colors.grey,
          ),
          drawerScrollViewButtons(
              text: "Profil",
              icon: "assets/images/user.svg",
              width: width,
              height: height),
          drawerScrollViewButtons(
              text: "Listeler",
              icon: "assets/images/list.svg",
              width: width,
              height: height),
          drawerScrollViewButtons(
              text: "Konular",
              icon: "assets/images/bubblechat.svg",
              width: width,
              height: height),
          drawerScrollViewButtons(
              text: "Yer işaretleri",
              icon: "assets/images/tag.svg",
              width: width,
              height: height),
          drawerScrollViewButtons(
              text: "Anlar",
              icon: "assets/images/bolt.svg",
              width: width,
              height: height),
          drawerScrollViewButtons(
              text: "Gelire dönüştürme",
              icon: "assets/images/money.svg",
              width: width,
              height: height),
          Container(
            margin: EdgeInsets.only(
              bottom: height * 0.02,
              top: height * 0.02,
            ),
            height: 0.5,
            color: Colors.grey,
          ),
          drawerScrollViewButtons(
              text: "Twitter for Professionals",
              icon: "assets/images/rocket.svg",
              width: width,
              height: height),
          Container(
            margin: EdgeInsets.only(
              bottom: height * 0.02,
              top: height * 0.02,
            ),
            height: 0.5,
            color: Colors.grey,
          ),
          drawerScrollViewButtons(
              text: "Ayarlar ve gizlilik", width: width, height: height),
          drawerScrollViewButtons(
              text: "Yardım Merkezi", width: width, height: height),
        ],
      ),
    ),
  );
}

Widget drawerBodyFirstPositionLowerPart( {required double height, required double width}) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(width: 0.5, color: Colors.grey)),
    ),
    padding:
        EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: height * 0.03,
          width: height * 0.03,
          child: SvgPicture.asset("assets/images/lamp.svg", fit: BoxFit.cover),
        ),
        SizedBox(
          height: height * 0.03,
          width: height * 0.03,
          child:
              SvgPicture.asset("assets/images/qrcode.svg", fit: BoxFit.cover),
        ),
      ],
    ),
  );
}
