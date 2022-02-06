import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/models/user_model.dart';

class BasicProfileListTile extends StatelessWidget {
  const BasicProfileListTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.02),
        child: Row(
          children: [
            InkWell(
              customBorder: const CircleBorder(),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.userProfilePicture),
                radius: height * 0.028,
              ),
            ),
            
            Container(
              height: height*0.054,
              margin: EdgeInsets.only(left: width*0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(user.username,style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.bold),),
                  Text(user.userEmail,style: TextStyle(fontSize: width*0.04,color: ColorsConstant.grey),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
