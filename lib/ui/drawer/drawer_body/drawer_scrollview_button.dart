import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget drawerScrollViewButtons({required String text,String? icon,required double width,required double height}){
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
              child: SvgPicture.asset(icon,fit:BoxFit.cover),
            ),
          ),
          Text(text,style: TextStyle(fontSize: width*0.045,color: Colors.black),),
        ],
      ),
    ),
  );
}