import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/models/user_model.dart';

bool isArrowDown = true; 
class DrawerHeaderUI extends StatelessWidget {
  const DrawerHeaderUI({ 
    Key? key,
    required this.onChange,
  }) : super(key: key);

  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
      ),
      padding: EdgeInsets.fromLTRB(
          width * 0.05, height * 0.05, width * 0.05, height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(selectedUser.userProfilePicture),
            radius: width * 0.08,
          ),
         
          Container(
            margin: EdgeInsets.only(
              top: height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedUser.username,
                  style: TextStyle(
                      fontSize: width * 0.052,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                
                GestureDetector(
                  onTap: () {
                    if (isArrowDown) {
                      isArrowDown = false;
                    } else {
                      isArrowDown = true;
                    }
                    onChange();
                  },
                  
                  child: SizedBox(
                    height: height * 0.025,
                    width: height * 0.025,
                    child: isArrowDown
                        ? SvgPicture.asset("assets/icons/downarrow.svg",
                            fit: BoxFit.cover, color: Colors.black)
                        : SvgPicture.asset("assets/icons/uparrow.svg",
                            fit: BoxFit.cover, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        
          Container(
            margin: EdgeInsets.only(top: height * 0.01),
            child: Text(
              selectedUser.userEmail,
              style: TextStyle(
                  fontSize: width * 0.045, color: const Color(0xFF7B7B7B)),
            ),
          ),
         
          Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                      text: selectedUser.following.length.toString(),
                      style: TextStyle(
                          color: Colors.black, fontSize: width * 0.04),
                      children: [
                        TextSpan(
                          text: " Takip edilen",
                          style: TextStyle(
                              color: const Color(0xFF7B7B7B),
                              fontSize: width * 0.04),
                        ),
                      ]),
                ),
                Container(
                  width: width * 0.04,
                ),
                RichText(
                  text: TextSpan(
                      text: selectedUser.followers.length.toString(),
                      style: TextStyle(
                          color: Colors.black, fontSize: width * 0.04),
                      children: [
                        TextSpan(
                          text: " Takipçi",
                          style: TextStyle(
                              color: const Color(0xFF7B7B7B),
                              fontSize: width * 0.04),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}