import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/assets/constatns.dart';
import 'package:twitter/models/user_model.dart';

class ChatPageAppbar extends StatelessWidget {
  const ChatPageAppbar({
    Key? key,
    required this.user, 
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height*0.08,
      padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.01),

      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          
          SizedBox(
            width: width*0.63,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.username,style: TextStyle(color: Colors.black,fontSize: width *0.047,fontWeight: FontWeight.bold),),
                Text(user.userEmail,style: TextStyle(color: Color(0x9E585858), fontSize: width * 0.035),),
              ],
            ),
          ),

          GestureDetector(
            onTap: (){},
            child: SizedBox(
              height: height*0.03,
              width: height*0.03,
              child: SvgPicture.asset(IconsConstant.chatPageAppbarButton,fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }
}