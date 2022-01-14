import 'package:flutter/material.dart';

class DrawerBodyExpanded extends StatefulWidget {
  const DrawerBodyExpanded({Key? key}) : super(key: key);

  @override
  _DrawerBodyExpandedState createState() =>
      _DrawerBodyExpandedState();
}

class _DrawerBodyExpandedState extends State<DrawerBodyExpanded> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(left: width * 0.05),
            height: height * 0.06,
            alignment: Alignment.centerLeft,
            child: Text(
              "Yeni hesap oluştur",
              style: TextStyle(fontSize: width * 0.04),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(
              left: width * 0.05,
            ),
            height: height * 0.06,
            alignment: Alignment.centerLeft,
            child: Text(
              "Var olan bir hesabı ekle",
              style: TextStyle(fontSize: width * 0.04),
            ),
          ),
        ),
      ],
    );
  }
}