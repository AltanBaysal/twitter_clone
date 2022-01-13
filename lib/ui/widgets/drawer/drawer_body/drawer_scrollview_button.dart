import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class DrawerScrollViewButton extends StatelessWidget {
  const DrawerScrollViewButton({
    Key? key,
    this.icon,
    required this.text
  }) : super(key: key);

  final String? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
    onTap: (){},
    child: Container(
      margin: EdgeInsets.only(left: width*0.05),
      height: height*0.08,
      child: Row( 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(icon != null)Container(
            margin: EdgeInsets.only(right: width*0.04),
            child: SizedBox(
              height: height*0.03,
              width: height*0.03,
              //? iconda ünlem kullandım yukarda null değilse gir diyorum ama yinde null hatası veriyordu
              child: SvgPicture.asset(icon!,fit:BoxFit.cover),
            ),
          ),
          Text(text,style: TextStyle(fontSize: width*0.045,color: Colors.black),),
        ],
      ),
    ),
  );
  }
}